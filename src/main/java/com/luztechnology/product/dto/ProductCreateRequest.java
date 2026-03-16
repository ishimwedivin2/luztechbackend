package com.luztechnology.product.dto;

import com.luztechnology.product.entity.ProductStatus;
import lombok.Data;
import java.math.BigDecimal;
import java.util.UUID;

@Data
public class ProductCreateRequest {
    private String name;
    private String description;
    private BigDecimal price;
    private String sku;
    private ProductStatus status;
    private UUID categoryId;
}
