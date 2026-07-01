package com.luztechnology.order.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Data
@Builder
public class CustomerOrderResponse {
    private UUID id;
    private String orderNumber;
    private String status;
    private BigDecimal subTotalAmount;
    private BigDecimal taxAmount;
    private BigDecimal taxRate;
    private BigDecimal totalAmount;
    private String paymentMethod;
    private String paymentReference;
    private String shippingAddress;
    private String shippingProvince;
    private String shippingDistrict;
    private String shippingSector;
    private String shippingCell;
    private String shippingVillage;
    private String deliveryInstructions;
    private String deliveryPhoneNumber;
    private LocalDateTime createdAt;
    private List<OrderItemResponse> orderItems;
}
