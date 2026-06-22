package com.luztechnology.payment.service;

import com.luztechnology.order.entity.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class AirtelPaymentService implements PaymentService {

    private static final Logger logger = LoggerFactory.getLogger(AirtelPaymentService.class);

    @Override
    public boolean supports(String paymentMethod) {
        return "AIRTEL_MONEY".equalsIgnoreCase(paymentMethod) || "AIRTEL_MOMO".equalsIgnoreCase(paymentMethod);
    }

    @Override
    public String initiatePayment(Order order) {
        logger.info("Initiating Airtel Money payment for Order ID: {}", order.getId());
        // Call to Airtel Money API 
        // Stub implementation
        return "AIRTEL_MOMO_REF_" + order.getId();
    }

    @Override
    public boolean verifyWebhook(String payload, String signature) {
        logger.info("Verifying Airtel MoMo Webhook. Payload: {}", payload);
        return true;
    }

    @Override
    public boolean isImmediateConfirmation() {
        return true;
    }
}
