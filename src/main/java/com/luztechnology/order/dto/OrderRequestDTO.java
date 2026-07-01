package com.luztechnology.order.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Data
public class OrderRequestDTO {
    private List<OrderItemDTO> items;
    private UUID shippingAddressId;
    private String shippingAddress;
    private String billingAddress;
    private String shippingProvince;
    private String shippingDistrict;
    private String shippingSector;
    private String shippingCell;
    private String shippingVillage;
    private String deliveryInstructions;
    private String deliveryPhoneNumber;
    private String paymentMethod;
    private BigDecimal discountAmount;
    private String couponCode;

    @Data
    public static class OrderItemDTO {
        private java.util.UUID productId;
        private Integer quantity;
        private BigDecimal unitPrice;
    }
}
