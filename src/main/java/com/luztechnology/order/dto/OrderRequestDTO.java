package com.luztechnology.order.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.util.List;

@Data
public class OrderRequestDTO {
    private List<OrderItemDTO> items;
    private String shippingAddress;
    private BigDecimal totalAmount;
    private String paymentMethod;

    @Data
    public static class OrderItemDTO {
        private java.util.UUID productId;
        private Integer quantity;
        private BigDecimal unitPrice;
    }
}
