package com.luztechnology.inventory.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.inventory.entity.InventoryItem;
import com.luztechnology.inventory.entity.ProcurementOrder;
import com.luztechnology.inventory.entity.Supplier;
import com.luztechnology.inventory.repository.ProcurementOrderRepository;
import com.luztechnology.inventory.repository.SupplierRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ProcurementService {

    private final ProcurementOrderRepository procurementRepository;
    private final SupplierRepository supplierRepository;

    @Transactional
    public ProcurementOrder createDraftOrder(InventoryItem item, Integer quantity) {
        Supplier supplier = supplierRepository.findAll().stream()
                .filter(Supplier::isActive)
                .findFirst()
                .orElseGet(() -> supplierRepository.save(Supplier.builder()
                        .name("Default Network Supplier")
                        .contactEmail("procurement@luztech.com")
                        .active(true)
                        .build()));

        ProcurementOrder order = ProcurementOrder.builder()
                .inventoryItem(item)
                .supplier(supplier)
                .quantityOrdered(quantity)
                .status("PENDING")
                .totalCost(BigDecimal.ZERO) // Set actual cost later
                .expectedDeliveryDate(LocalDate.now().plusDays(7))
                .build();

        return procurementRepository.save(order);
    }

    public List<ProcurementOrder> getAllOrders() {
        return procurementRepository.findAll();
    }
}
