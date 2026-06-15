package com.luztechnology.order.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CompleteReturnRequest {
    private BigDecimal refundedAmount;
    private String refundReference;
    private String adminNotes;
}
