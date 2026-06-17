package com.luztechnology.inventory.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.inventory.entity.InventoryItem;
import com.luztechnology.inventory.entity.StockMovement;
import com.luztechnology.inventory.repository.InventoryItemRepository;
import com.luztechnology.inventory.repository.StockMovementRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class InventoryService {

    private final InventoryItemRepository inventoryItemRepository;
    private final StockMovementRepository stockMovementRepository;

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
                .filter(item -> item.getQuantity() <= item.getLowStockThreshold())
                .toList();
    }

    @Transactional(readOnly = true)
    public Map<String, Object> getStockDashboard() {
        List<InventoryItem> items = inventoryItemRepository.findAll();
        List<InventoryItem> lowStock = items.stream()
                .filter(item -> item.getQuantity() <= item.getLowStockThreshold())
                .toList();
        List<InventoryItem> outOfStock = items.stream()
                .filter(item -> item.getQuantity() == 0)
                .toList();
        int totalUnits = items.stream()
                .mapToInt(item -> item.getQuantity() == null ? 0 : item.getQuantity())
                .sum();
        int totalThresholdUnits = items.stream()
                .mapToInt(item -> item.getLowStockThreshold() == null ? 0 : item.getLowStockThreshold())
                .sum();

        List<Map<String, Object>> reorderSuggestions = lowStock.stream()
                .map(item -> {
                    int threshold = item.getLowStockThreshold() == null ? 0 : item.getLowStockThreshold();
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
                .sorted((left, right) -> {
                    if (left.getCreatedAt() == null && right.getCreatedAt() == null) {
                        return 0;
                    }
                    if (left.getCreatedAt() == null) {
                        return 1;
                    }
                    if (right.getCreatedAt() == null) {
                        return -1;
                    }
                    return right.getCreatedAt().compareTo(left.getCreatedAt());
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
        InventoryItem item = getItemById(itemId);

        // Record movement
        StockMovement movement = StockMovement.builder()
                .inventoryItem(item)
                .quantity(quantityChange)
                .reason(reason)
                .type(type)
                .referenceId(referenceId)
                .build();
        stockMovementRepository.save(movement);

        // Update quantity
        item.setQuantity(item.getQuantity() + quantityChange);
        if (item.getQuantity() < 0) {
            throw new IllegalArgumentException("Insufficient stock for item: " + item.getProductName());
        }

        return inventoryItemRepository.save(item);
    }
}
