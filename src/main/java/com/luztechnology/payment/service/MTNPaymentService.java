package com.luztechnology.payment.service;

import com.luztechnology.order.entity.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class MTNPaymentService implements PaymentService {

    private static final Logger logger = LoggerFactory.getLogger(MTNPaymentService.class);

    @Override
    public boolean supports(String paymentMethod) {
        return "MTN_MOMO".equalsIgnoreCase(paymentMethod);
    }

    @Override
    public String initiatePayment(Order order) {
        logger.info("Initiating MTN MoMo payment for Order ID: {}", order.getId());
        // Call to MTN MoMo API 
        // Stub implementation
        return "MTN_MOMO_REF_" + order.getId();
    }

    @Override
    public boolean verifyWebhook(String payload, String signature) {
        logger.info("Verifying MTN MoMo Webhook. Payload: {}", payload);
        // Verify MTN Signature X-Signature
        return true;
    }
}
