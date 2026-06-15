package com.luztechnology.receipt.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Data
@Builder
public class ReceiptResponse {
    private UUID orderId;
    private String receiptNumber;
    private String orderNumber;
    private String orderChannel;
    private String customerName;
    private String cashierEmail;
    private String paymentMethod;
    private String paymentReference;
    private BigDecimal subTotalAmount;
    private BigDecimal taxRate;
    private BigDecimal taxAmount;
    private BigDecimal totalAmount;
    private LocalDateTime issuedAt;
    private List<ReceiptItemResponse> items;
}
