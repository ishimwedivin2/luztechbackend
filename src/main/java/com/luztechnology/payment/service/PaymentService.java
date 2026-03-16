package com.luztechnology.payment.service;

import com.luztechnology.order.entity.Order;

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
}
