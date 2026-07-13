package com.luztechnology.product.dto;

import com.luztechnology.product.entity.ProductStatus;
import lombok.Data;
import java.math.BigDecimal;
import java.util.UUID;

@Data
public class ProductCreateRequest {
    private String name;
    private String description;

    /** Selling price — what the customer pays before tax. */
    private BigDecimal price;

    /** Cost price — what the business paid the supplier per unit. */
    private BigDecimal costPrice;

    private String sku;
    private ProductStatus status;
    private UUID categoryId;
}
