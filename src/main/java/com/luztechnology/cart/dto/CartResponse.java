package com.luztechnology.cart.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Data
@Builder
public class CartResponse {
    private UUID id;
    private List<CartItemResponse> items;
    private BigDecimal totalAmount;
    private BigDecimal subTotalExcludingTax;
    private BigDecimal taxTotal;
    private int totalItems;           // sum of all item quantities
}
