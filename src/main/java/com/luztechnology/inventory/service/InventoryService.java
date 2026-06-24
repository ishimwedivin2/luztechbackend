package com.luztechnology.inventory.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.inventory.entity.InventoryItem;
import com.luztechnology.inventory.entity.StockMovement;
import com.luztechnology.inventory.repository.InventoryItemRepository;
import com.luztechnology.inventory.repository.StockMovementRepository;
import com.luztechnology.notification.service.MailService;
import com.luztechnology.product.entity.Product;
import com.luztechnology.product.repository.ProductRepository;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.dao.DataIntegrityViolationException;

import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class InventoryService {

    private static final Logger logger = LoggerFactory.getLogger(InventoryService.class);
    private static final int HARD_LOW_STOCK_MIN = 5;

    private final InventoryItemRepository inventoryItemRepository;
    private final StockMovementRepository stockMovementRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    private final MailService mailService;

    // ── Auto-sync: create InventoryItem for any Product that doesn't have one yet ──
    @Transactional
    public void syncFromProducts() {
        int synced = 0;
        for (Product p : productRepository.findAll()) {
            if (p.getSku() == null) continue;
            if (inventoryItemRepository.findBySku(p.getSku()).isPresent()) continue;
            try {
                inventoryItemRepository.save(InventoryItem.builder()
                        .sku(p.getSku())
                        .productName(p.getName())
                        .quantity(0)
                        .lowStockThreshold(HARD_LOW_STOCK_MIN)
                        .location("Main Warehouse")
                        .build());
                synced++;
            } catch (DataIntegrityViolationException ignored) {
                // another thread already inserted this SKU — safe to skip
            }
        }
        if (synced > 0) {
            logger.info("Auto-synced {} inventory items from products", synced);
        }
    }

    @Transactional(readOnly = true)
    public List<InventoryItem> getAllItems() {
        return inventoryItemRepository.findAll();
    }

    @Transactional(readOnly = true)
    public InventoryItem getItemById(UUID id) {
        return inventoryItemRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Inventory Item not found for id: " + id));
    }

    @Transactional(readOnly = true)
    public List<InventoryItem> getLowStockItems() {
        return inventoryItemRepository.findAll().stream()
                .filter(item -> item.getQuantity() != null
                        && item.getQuantity() <= Math.max(HARD_LOW_STOCK_MIN, item.getLowStockThreshold() == null ? 0 : item.getLowStockThreshold()))
                .toList();
    }

    @Transactional(readOnly = true)
    public Map<String, Object> getStockDashboard() {
        List<InventoryItem> items = inventoryItemRepository.findAll();
        List<InventoryItem> lowStock = items.stream()
                .filter(item -> item.getQuantity() != null
                        && item.getQuantity() <= Math.max(HARD_LOW_STOCK_MIN, item.getLowStockThreshold() == null ? 0 : item.getLowStockThreshold()))
                .toList();
        List<InventoryItem> outOfStock = items.stream()
                .filter(item -> item.getQuantity() == null || item.getQuantity() == 0)
                .toList();
        int totalUnits = items.stream()
                .mapToInt(item -> item.getQuantity() == null ? 0 : item.getQuantity())
                .sum();
        int totalThresholdUnits = items.stream()
                .mapToInt(item -> item.getLowStockThreshold() == null ? 0 : item.getLowStockThreshold())
                .sum();

        List<Map<String, Object>> reorderSuggestions = lowStock.stream()
                .map(item -> {
                    int threshold = item.getLowStockThreshold() == null ? HARD_LOW_STOCK_MIN : item.getLowStockThreshold();
                    int quantity = item.getQuantity() == null ? 0 : item.getQuantity();
                    Map<String, Object> row = new HashMap<>();
                    row.put("itemId", item.getId());
                    row.put("sku", item.getSku());
                    row.put("productName", item.getProductName());
                    row.put("currentQuantity", quantity);
                    row.put("lowStockThreshold", threshold);
                    row.put("suggestedReorderQuantity", Math.max(0, (threshold * 2) - quantity));
                    row.put("location", item.getLocation());
                    return row;
                })
                .toList();

        List<Map<String, Object>> recentMovements = stockMovementRepository.findAll().stream()
                .sorted((l, r) -> {
                    if (l.getCreatedAt() == null && r.getCreatedAt() == null) return 0;
                    if (l.getCreatedAt() == null) return 1;
                    if (r.getCreatedAt() == null) return -1;
                    return r.getCreatedAt().compareTo(l.getCreatedAt());
                })
                .limit(10)
                .map(movement -> {
                    Map<String, Object> row = new HashMap<>();
                    row.put("id", movement.getId());
                    row.put("itemId", movement.getInventoryItem().getId());
                    row.put("productName", movement.getInventoryItem().getProductName());
                    row.put("type", movement.getType());
                    row.put("quantity", movement.getQuantity());
                    row.put("reason", movement.getReason());
                    row.put("referenceId", movement.getReferenceId());
                    row.put("createdAt", movement.getCreatedAt());
                    return row;
                })
                .toList();

        Map<String, Object> dashboard = new HashMap<>();
        dashboard.put("totalItems", items.size());
        dashboard.put("totalUnits", totalUnits);
        dashboard.put("totalThresholdUnits", totalThresholdUnits);
        dashboard.put("lowStockCount", lowStock.size());
        dashboard.put("outOfStockCount", outOfStock.size());
        dashboard.put("stockHealthPercent", items.isEmpty()
                ? 100.0
                : ((double) (items.size() - lowStock.size()) / items.size()) * 100.0);
        dashboard.put("lowStockItems", lowStock);
        dashboard.put("outOfStockItems", outOfStock);
        dashboard.put("reorderSuggestions", reorderSuggestions);
        dashboard.put("recentMovements", recentMovements);
        return dashboard;
    }

    @Transactional
    public InventoryItem addItem(InventoryItem item) {
        return inventoryItemRepository.save(item);
    }

    @Transactional
    public InventoryItem adjustStock(UUID itemId, int quantityChange, String reason, String type, String referenceId) {
        InventoryItem item = inventoryItemRepository.findByIdForUpdate(itemId)
                .orElseThrow(() -> new ResourceNotFoundException("Inventory Item not found for id: " + itemId));

        int newQuantity = item.getQuantity() + quantityChange;
        if (newQuantity < 0) {
            throw new IllegalArgumentException("Insufficient stock for item: " + item.getProductName()
                    + " (available: " + item.getQuantity() + ", requested: " + (-quantityChange) + ")");
        }

        StockMovement movement = StockMovement.builder()
                .inventoryItem(item)
                .quantity(quantityChange)
                .reason(reason)
                .type(type)
                .referenceId(referenceId)
                .build();
        stockMovementRepository.save(movement);

        item.setQuantity(newQuantity);
        InventoryItem saved = inventoryItemRepository.save(item);

        // Real-time low-stock alert to admin when quantity drops at or below threshold
        int threshold = Math.max(HARD_LOW_STOCK_MIN, item.getLowStockThreshold() == null ? 0 : item.getLowStockThreshold());
        if (saved.getQuantity() <= threshold) {
            sendLowStockAlertToAdmins(saved);
        }

        return saved;
    }

    private void sendLowStockAlertToAdmins(InventoryItem item) {
        try {
            List<User> admins = userRepository.findByRoles_Name("ROLE_ADMIN");
            if (admins.isEmpty()) return;

            Map<String, Object> model = new HashMap<>();
            model.put("productName", item.getProductName());
            model.put("sku", item.getSku());
            model.put("currentQuantity", item.getQuantity());
            model.put("threshold", Math.max(HARD_LOW_STOCK_MIN, item.getLowStockThreshold() == null ? 0 : item.getLowStockThreshold()));
            model.put("location", item.getLocation());

            for (User admin : admins) {
                mailService.sendEmail(
                        admin.getEmail(),
                        "⚠ Low Stock Alert: " + item.getProductName(),
                        "low-stock-alert",
                        model
                );
            }
            logger.info("Low-stock alert sent for SKU {} (qty: {})", item.getSku(), item.getQuantity());
        } catch (Exception e) {
            logger.error("Failed to send low-stock alert for {}", item.getSku(), e);
        }
    }
}
