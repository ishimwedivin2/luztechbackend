package com.luztechnology.inventory.entity;

import com.luztechnology.common.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import java.math.BigDecimal;

@Entity
@Table(name = "inventory_items")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class InventoryItem extends BaseEntity {

    @Column(nullable = false, unique = true)
    private String sku;

    @Column(nullable = false)
    private String productName;

    @Column(nullable = false)
    private Integer quantity;

    @Column(nullable = false)
    private Integer lowStockThreshold;

    @Column(nullable = false)
    private String location; // Warehouse location

    /**
     * Cost per unit stored in this inventory location.
     * Updated whenever a procurement order is received.
     */
    @Builder.Default
    private BigDecimal unitCost = BigDecimal.ZERO;
}
