package com.luztechnology.pos.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Data
@Builder
public class POSReceiptResponse {
    private UUID orderId;
    private String orderNumber;
    private String cashierEmail;
    private String customerEmail;
    private String paymentMethod;
    private String paymentReference;
    private BigDecimal totalAmount;
    private LocalDateTime soldAt;
    private List<POSReceiptLineResponse> items;
}
