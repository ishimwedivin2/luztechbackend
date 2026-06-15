package com.luztechnology.inventory.repository;

import com.luztechnology.inventory.entity.ProcurementOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ProcurementOrderRepository extends JpaRepository<ProcurementOrder, UUID> {
    List<ProcurementOrder> findByStatus(String status);
    List<ProcurementOrder> findBySupplierId(UUID supplierId);
    List<ProcurementOrder> findByInventoryItemId(UUID inventoryItemId);
}
