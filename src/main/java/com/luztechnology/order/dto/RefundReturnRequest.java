package com.luztechnology.order.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class RefundReturnRequest {
    private BigDecimal refundedAmount;
    private String adminNotes;
}
