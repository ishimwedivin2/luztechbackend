package com.luztechnology.inventory.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.luztechnology.common.entity.BaseEntity;
import com.luztechnology.product.entity.Product;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "procurement_orders")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProcurementOrder extends BaseEntity {

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "supplier_id", nullable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private Supplier supplier;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "inventory_item_id", nullable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private InventoryItem inventoryItem;

    /**
     * Direct product reference for cost-price auto-population.
     * Optional — if set, unitCost defaults to product.costPrice.
     */
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler", "images", "reviews", "inventoryItem", "discount", "taxRate", "category"})
    private Product product;

    @Column(nullable = false)
    private Integer quantityOrdered;

    private Integer quantityReceived;

    @Column(nullable = false)
    private String status; // "PENDING", "RECEIVED", "CANCELLED", "PARTIALLY_RECEIVED"

    /**
     * Cost per unit for this procurement order.
     * Defaults to product.costPrice; can be overridden per order (e.g. special supplier deal).
     */
    @Builder.Default
    private BigDecimal unitCost = BigDecimal.ZERO;

    /**
     * Total cost = unitCost × quantityOrdered.
     * Computed when the order is saved or received.
     */
    private BigDecimal totalCost;

    private LocalDate expectedDeliveryDate;
}
