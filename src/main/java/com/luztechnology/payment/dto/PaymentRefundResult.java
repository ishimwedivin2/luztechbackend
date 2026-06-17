package com.luztechnology.payment.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PaymentRefundResult {
    private String provider;
    private String refundReference;
    private String status;
    private boolean successful;
    private boolean pending;
    private String message;
}
