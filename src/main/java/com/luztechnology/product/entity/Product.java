package com.luztechnology.product.entity;

import com.luztechnology.common.entity.BaseEntity;
import com.luztechnology.finance.entity.TaxRate;
import com.luztechnology.inventory.entity.InventoryItem;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.persistence.Transient;
import lombok.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "products")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Product extends BaseEntity {

    @Column(nullable = false)
    private String name;

    @Column(columnDefinition = "TEXT")
    private String description;

    /**
     * Selling price — what the customer pays BEFORE tax.
     */
    @Column(nullable = false)
    private BigDecimal price;

    /**
     * Cost price — what the business paid the supplier for one unit.
     * Used for COGS and profit calculations. Never exposed to customers.
     */
    @Builder.Default
    private BigDecimal costPrice = BigDecimal.ZERO;

    @Column(precision = 3, scale = 2)
    @Builder.Default
    private BigDecimal averageRating = BigDecimal.ZERO;

    @Column(nullable = false)
    private String sku;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ProductStatus status; // ACTIVE, DRAFT, ARCHIVED

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private Category category;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "discount_id")
    private Discount discount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tax_rate_id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private TaxRate taxRate;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventory_item_id")
    private InventoryItem inventoryItem;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private List<ProductImage> images = new ArrayList<>();

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private List<ProductReview> reviews = new ArrayList<>();

    @Column(nullable = false)
    @Builder.Default
    private boolean featured = false;

    @Transient
    private Integer stock;
}
