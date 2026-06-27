package com.luztechnology.payment.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentStatusResponse {
    private UUID orderId;
    private String orderNumber;
    private String orderStatus;
    private String paymentMethod;
    private String paymentReference;
    private boolean paid;
    private String message;
    private BigDecimal totalAmount;
    private String clientSecret; // Stripe only — used by frontend Stripe.js to confirm payment
}
