package com.luztechnology.payment.service;

import com.luztechnology.order.entity.Order;
import com.luztechnology.payment.dto.PaymentRefundResult;

import java.math.BigDecimal;

public interface PaymentService {
    /**
     * @return boolean indicating whether the provider supports processing this payment
     */
    boolean supports(String paymentMethod);
    
    /**
     * @return Payment reference or redirect URL
     */
    String initiatePayment(Order order);
    
    /**
     * Handle incoming webhook data for verifying payment status
     * @return boolean true if verified/paid successfully
     */
    boolean verifyWebhook(String payload, String signature);

    default boolean supportsRefund(String paymentMethod) {
        return supports(paymentMethod);
    }

    default PaymentRefundResult refund(Order order, BigDecimal amount, String reason) {
        throw new UnsupportedOperationException("Refunds are not supported for this payment provider");
    }

    default PaymentRefundResult getRefundStatus(String refundReference) {
        throw new UnsupportedOperationException("Refund status checks are not supported for this payment provider");
    }

    /** True for stubs/card/PayPal that confirm immediately without a real async webhook. */
    default boolean isImmediateConfirmation() {
        return false;
    }
}
