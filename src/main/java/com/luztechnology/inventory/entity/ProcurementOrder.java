package com.luztechnology.inventory.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.luztechnology.common.entity.BaseEntity;
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

    @Column(nullable = false)
    private Integer quantityOrdered;

    private Integer quantityReceived;

    @Column(nullable = false)
    private String status; // "PENDING", "RECEIVED", "CANCELLED"

    private BigDecimal totalCost;

    private LocalDate expectedDeliveryDate;
}
