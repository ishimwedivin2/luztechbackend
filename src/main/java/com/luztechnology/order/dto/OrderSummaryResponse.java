package com.luztechnology.order.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.util.UUID;

@Data
@Builder
public class OrderSummaryResponse {
    private UUID id;
    private String orderNumber;
    private String status;
    private BigDecimal totalAmount;
    private BigDecimal taxRate;
    private String paymentMethod;
    private String shippingAddress;
    private String shippingProvince;
    private String shippingDistrict;
    private String shippingSector;
    private String shippingCell;
    private String shippingVillage;
    private String deliveryInstructions;
    private String deliveryPhoneNumber;
}
