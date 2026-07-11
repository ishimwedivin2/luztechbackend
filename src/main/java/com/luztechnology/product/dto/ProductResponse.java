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
    private BigDecimal price;
    private BigDecimal originalPrice;
    private BigDecimal discountedPrice;
    private BigDecimal discountAmount;
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
