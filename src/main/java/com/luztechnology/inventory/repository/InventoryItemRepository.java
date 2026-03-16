package com.luztechnology.inventory.repository;

import com.luztechnology.inventory.entity.InventoryItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface InventoryItemRepository extends JpaRepository<InventoryItem, UUID> {
    Optional<InventoryItem> findBySku(String sku);
    List<InventoryItem> findByQuantityLessThanEqual(Integer lowStockThreshold);
}
