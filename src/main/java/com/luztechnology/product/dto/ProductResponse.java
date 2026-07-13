package com.luztechnology.product.dto;

import com.luztechnology.product.entity.ProductStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductResponse {
    private UUID id;
    private String name;
    private String description;

    /** Selling price (before tax). Customer-facing. */
    private BigDecimal price;

    /** Cost price — internal only; never sent to customer-facing shop APIs. */
    private BigDecimal costPrice;

    /** Profit per unit = price − costPrice (before tax). */
    private BigDecimal profitPerUnit;

    /** Profit margin % = (profitPerUnit / price) × 100. */
    private BigDecimal profitMarginPercent;

    private BigDecimal originalPrice;
    private BigDecimal discountedPrice;
    private BigDecimal discountAmount;
    private BigDecimal priceIncludingTax;
    private BigDecimal discountedPriceIncludingTax;
    private BigDecimal taxAmount;
    private BigDecimal taxRate;
    private UUID taxRateId;
    private String taxName;
    private String taxCode;
    private boolean taxIncluded;
    private String sku;
    private ProductStatus status;
    private UUID categoryId;
    private String categoryName;
    private List<ProductImageResponse> images;
    private boolean featured;
    private BigDecimal discountPercentage;
    private String discountName;
    private long reviewsCount;
    private Double averageRating;
}
