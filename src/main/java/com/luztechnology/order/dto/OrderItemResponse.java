package com.luztechnology.order.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.util.UUID;

@Data
@Builder
public class OrderItemResponse {
    private UUID productId;
    private String productName;
    private String imageUrl;
    private Integer quantity;
    private BigDecimal unitPrice;
    private BigDecimal subTotal;
    private BigDecimal taxRate;
    private String taxName;
    private BigDecimal unitTaxAmount;
    private BigDecimal lineTaxAmount;
    private BigDecimal unitPriceIncludingTax;
    private BigDecimal lineTotalIncludingTax;
}
