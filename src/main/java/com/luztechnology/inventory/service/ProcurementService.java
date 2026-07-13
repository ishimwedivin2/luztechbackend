package com.luztechnology.inventory.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.inventory.dto.ProcurementOrderRequest;
import com.luztechnology.inventory.entity.InventoryItem;
import com.luztechnology.inventory.entity.ProcurementOrder;
import com.luztechnology.inventory.entity.Supplier;
import com.luztechnology.inventory.repository.InventoryItemRepository;
import com.luztechnology.inventory.repository.ProcurementOrderRepository;
import com.luztechnology.inventory.repository.SupplierRepository;
import com.luztechnology.product.entity.Product;
import com.luztechnology.product.repository.ProductRepository;
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
    private final InventoryItemRepository inventoryItemRepository;
    private final InventoryService inventoryService;
    private final ProductRepository productRepository;

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

    @Transactional(readOnly = true)
    public List<ProcurementOrder> getAllOrders() {
        return procurementRepository.findAll();
    }

    @Transactional(readOnly = true)
    public ProcurementOrder getOrderById(UUID id) {
        return procurementRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Procurement order not found with id: " + id));
    }

    @Transactional(readOnly = true)
    public List<ProcurementOrder> getOrdersByStatus(String status) {
        return procurementRepository.findByStatus(status);
    }

    @Transactional
    public ProcurementOrder createOrder(ProcurementOrderRequest request) {
        Supplier supplier = getSupplierById(request.getSupplierId());
        InventoryItem item = inventoryItemRepository.findById(request.getInventoryItemId())
                .orElseThrow(() -> new ResourceNotFoundException("Inventory item not found with id: " + request.getInventoryItemId()));

        // Resolve the linked Product (via explicit productId or through InventoryItem)
        Product product = null;
        if (request.getProductId() != null) {
            product = productRepository.findById(request.getProductId()).orElse(null);
        }
        if (product == null && item.getSku() != null) {
            product = productRepository.findBySku(item.getSku()).orElse(null);
        }

        // Resolve unitCost: use explicitly provided value first, then product.costPrice, then ZERO
        BigDecimal unitCost = request.getUnitCost();
        if (unitCost == null || unitCost.compareTo(BigDecimal.ZERO) == 0) {
            if (product != null && product.getCostPrice() != null
                    && product.getCostPrice().compareTo(BigDecimal.ZERO) > 0) {
                unitCost = product.getCostPrice();
            } else {
                unitCost = BigDecimal.ZERO;
            }
        }

        // Compute totalCost = unitCost × quantityOrdered
        BigDecimal totalCost = unitCost.multiply(BigDecimal.valueOf(request.getQuantityOrdered()));

        ProcurementOrder order = ProcurementOrder.builder()
                .supplier(supplier)
                .inventoryItem(item)
                .product(product)
                .quantityOrdered(request.getQuantityOrdered())
                .quantityReceived(0)
                .status("PENDING")
                .unitCost(unitCost)
                .totalCost(totalCost)
                .expectedDeliveryDate(request.getExpectedDeliveryDate() == null
                        ? LocalDate.now().plusDays(7)
                        : request.getExpectedDeliveryDate())
                .build();

        return procurementRepository.save(order);
    }

    @Transactional
    public ProcurementOrder updateOrderStatus(UUID id, String status) {
        ProcurementOrder order = getOrderById(id);
        order.setStatus(status.toUpperCase());
        return procurementRepository.save(order);
    }

    @Transactional
    public ProcurementOrder receiveOrder(UUID id, Integer quantityReceived) {
        ProcurementOrder order = getOrderById(id);
        if ("CANCELLED".equalsIgnoreCase(order.getStatus())) {
            throw new IllegalStateException("Cannot receive a cancelled procurement order");
        }
        if (quantityReceived > order.getQuantityOrdered()) {
            throw new IllegalArgumentException("Received quantity cannot exceed ordered quantity");
        }

        order.setQuantityReceived(quantityReceived);
        order.setStatus(quantityReceived.equals(order.getQuantityOrdered()) ? "RECEIVED" : "PARTIALLY_RECEIVED");

        // Update InventoryItem.unitCost to reflect the per-unit cost of this received stock
        if (order.getUnitCost() != null && order.getUnitCost().compareTo(BigDecimal.ZERO) > 0) {
            InventoryItem invItem = order.getInventoryItem();
            invItem.setUnitCost(order.getUnitCost());
            inventoryItemRepository.save(invItem);
        }

        inventoryService.adjustStock(
                order.getInventoryItem().getId(),
                quantityReceived,
                "Procurement received",
                "PROCUREMENT",
                order.getId().toString());

        return procurementRepository.save(order);
    }

    @Transactional
    public ProcurementOrder cancelOrder(UUID id) {
        ProcurementOrder order = getOrderById(id);
        if ("RECEIVED".equalsIgnoreCase(order.getStatus())) {
            throw new IllegalStateException("Cannot cancel a received procurement order");
        }
        order.setStatus("CANCELLED");
        return procurementRepository.save(order);
    }

    @Transactional(readOnly = true)
    public List<Supplier> getAllSuppliers(Boolean active) {
        if (active == null) {
            return supplierRepository.findAll();
        }
        return supplierRepository.findByActive(active);
    }

    @Transactional(readOnly = true)
    public Supplier getSupplierById(UUID id) {
        return supplierRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Supplier not found with id: " + id));
    }

    @Transactional
    public Supplier createSupplier(Supplier supplier) {
        return supplierRepository.save(supplier);
    }

    @Transactional
    public Supplier updateSupplier(UUID id, Supplier supplierUpdate) {
        Supplier supplier = getSupplierById(id);
        supplier.setName(supplierUpdate.getName());
        supplier.setContactEmail(supplierUpdate.getContactEmail());
        supplier.setContactPhone(supplierUpdate.getContactPhone());
        supplier.setAddress(supplierUpdate.getAddress());
        supplier.setActive(supplierUpdate.isActive());
        supplier.setPerformanceRating(supplierUpdate.getPerformanceRating());
        supplier.setNotes(supplierUpdate.getNotes());
        return supplierRepository.save(supplier);
    }

    @Transactional
    public Supplier setSupplierActive(UUID id, boolean active) {
        Supplier supplier = getSupplierById(id);
        supplier.setActive(active);
        return supplierRepository.save(supplier);
    }
}
