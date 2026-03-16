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
