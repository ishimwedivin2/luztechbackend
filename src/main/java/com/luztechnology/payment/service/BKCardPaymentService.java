package com.luztechnology.payment.service;

import com.luztechnology.order.entity.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class BKCardPaymentService implements PaymentService {

    private static final Logger logger = LoggerFactory.getLogger(BKCardPaymentService.class);

    @Override
    public boolean supports(String paymentMethod) {
        return "BK_CARD".equalsIgnoreCase(paymentMethod);
    }

    @Override
    public String initiatePayment(Order order) {
        logger.info("Initiating Bank of Kigali Card payment for Order ID: {}", order.getId());
        // Custom BK Payment Gateway integration
        // Stub implementation
        return "BK_CARD_REF_" + order.getId();
    }

    @Override
    public boolean verifyWebhook(String payload, String signature) {
        logger.info("Verifying BK Card Webhook. Payload: {}", payload);
        return true;
    }

    @Override
    public boolean isImmediateConfirmation() {
        return true;
    }
}
