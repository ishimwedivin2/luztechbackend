package com.luztechnology.cart.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.util.UUID;

@Data
@Builder
public class CartItemResponse {
    private UUID id;
    private UUID productId;
    private String productName;
    private String sku;
    private Integer quantity;
    private BigDecimal originalUnitPrice;
    private BigDecimal unitPrice;
    private BigDecimal discountPercentage;
    private BigDecimal discountAmount;
    private BigDecimal subTotal;
    private String imageUrl;          // primary product image for cart display
}
