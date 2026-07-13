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
    private BigDecimal originalUnitPriceIncludingTax;
    private BigDecimal unitPrice;
    private BigDecimal unitPriceIncludingTax;
    private BigDecimal taxRate;
    private String taxName;
    private String taxCode;
    private BigDecimal unitTaxAmount;
    private BigDecimal lineTaxAmount;
    private BigDecimal lineTotalIncludingTax;
    private BigDecimal discountPercentage;
    private BigDecimal discountAmount;
    private BigDecimal subTotal;
    private String imageUrl;          // primary product image for cart display
}
