package com.luztechnology.order.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.luztechnology.common.entity.BaseEntity;
import com.luztechnology.product.entity.Product;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Entity
@Table(name = "order_items")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderItem extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", nullable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler", "orderItems", "customer", "cashier"})
    private Order order;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler", "orderItems", "category", "discount", "images"})
    private Product product;

    @Column(nullable = false)
    private Integer quantity;

    /** Selling price per unit at time of sale (after any discount, before tax). */
    @Column(nullable = false)
    private BigDecimal unitPrice;

    @Column(nullable = false)
    private BigDecimal subTotal;

    // ── Tax fields ───────────────────────────────────────────────────────────
    private BigDecimal appliedTaxRate;
    private String appliedTaxName;
    private String appliedTaxCode;
    private BigDecimal unitTaxAmount;
    private BigDecimal lineTaxAmount;
    private BigDecimal unitPriceIncludingTax;
    private BigDecimal lineTotalIncludingTax;

    // ── Cost / COGS snapshot ─────────────────────────────────────────────────
    /**
     * Snapshot of product.costPrice at the moment of sale.
     * Locked-in so profit calculations remain accurate even if cost prices change later.
     */
    private BigDecimal unitCost;

    /**
     * unitCost × quantity — the Cost of Goods Sold for this line.
     * Summed across all order items to compute COGS in financial reports.
     */
    private BigDecimal lineCost;
}
