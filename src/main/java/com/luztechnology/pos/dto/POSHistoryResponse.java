package com.luztechnology.pos.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class POSHistoryResponse {
    private UUID orderId;
    private String orderNumber;
    private String cashierEmail;
    private String customerEmail;
    private String paymentMethod;
    private String paymentReference;
    private BigDecimal totalAmount;
    private int itemCount;
    private LocalDateTime soldAt;
}
