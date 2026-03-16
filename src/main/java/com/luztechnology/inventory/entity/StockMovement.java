package com.luztechnology.inventory.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "stock_movements")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StockMovement extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_item_id", nullable = false)
    private InventoryItem inventoryItem;

    @Column(nullable = false)
    private String type; // "IN", "OUT", "ADJUSTMENT"

    @Column(nullable = false)
    private Integer quantity; // Can be negative for "OUT"

    private String reason; // "RESTOCK", "SALE", "DAMAGE"
    
    // UUID of the order if applicable
    private String referenceId;
}
