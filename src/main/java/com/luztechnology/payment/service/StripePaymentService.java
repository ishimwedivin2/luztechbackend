package com.luztechnology.payment.service;

import com.luztechnology.order.entity.Order;
import com.luztechnology.payment.dto.PaymentRefundResult;
import com.stripe.Stripe;
import com.stripe.exception.SignatureVerificationException;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.stripe.model.Refund;
import com.stripe.net.Webhook;
import com.stripe.param.PaymentIntentCreateParams;
import com.stripe.param.RefundCreateParams;
import jakarta.annotation.PostConstruct;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Service
public class StripePaymentService implements PaymentService {

    private static final Logger logger = LoggerFactory.getLogger(StripePaymentService.class);

    @Value("${payment.stripe.secret-key:sk_test_placeholder}")
    private String secretKey;

    @Value("${payment.stripe.webhook-secret:whsec_placeholder}")
    private String webhookSecret;

    @Value("${payment.stripe.currency:usd}")
    private String currency;

    @PostConstruct
    public void init() {
        Stripe.apiKey = secretKey;
    }

    @Override
    public boolean supports(String paymentMethod) {
        return "STRIPE".equalsIgnoreCase(paymentMethod);
    }

    @Override
    public String initiatePayment(Order order) {
        logger.info("Initiating Stripe PaymentIntent for Order: {}", order.getOrderNumber());
        try {
            // Stripe amounts are in smallest currency unit (cents for USD)
            long amountInCents = order.getTotalAmount()
                    .multiply(BigDecimal.valueOf(100))
                    .setScale(0, RoundingMode.HALF_UP)
                    .longValue();

            PaymentIntentCreateParams params = PaymentIntentCreateParams.builder()
                    .setAmount(amountInCents)
                    .setCurrency(currency)
                    .setDescription("Order " + order.getOrderNumber() + " — Luz Technology")
                    .putMetadata("orderId", order.getId().toString())
                    .putMetadata("orderNumber", order.getOrderNumber())
                    .setAutomaticPaymentMethods(
                            PaymentIntentCreateParams.AutomaticPaymentMethods.builder()
                                    .setEnabled(true)
                                    .build())
                    .build();

            PaymentIntent intent = PaymentIntent.create(params);
            logger.info("Stripe PaymentIntent created: {} for order {}", intent.getId(), order.getOrderNumber());
            // Return the client_secret — frontend uses it to confirm with Stripe.js
            return intent.getClientSecret();
        } catch (StripeException e) {
            logger.error("Stripe payment initiation failed for order {}", order.getOrderNumber(), e);
            throw new RuntimeException("Stripe payment failed: " + e.getMessage(), e);
        }
    }

    @Override
    public boolean verifyWebhook(String payload, String signature) {
        try {
            Webhook.constructEvent(payload, signature, webhookSecret);
            return true;
        } catch (SignatureVerificationException e) {
            logger.warn("Stripe webhook signature verification failed", e);
            return false;
        } catch (Exception e) {
            logger.error("Stripe webhook processing error", e);
            return false;
        }
    }

    @Override
    public boolean isImmediateConfirmation() {
        // Stripe is confirmed via webhook (payment_intent.succeeded event)
        return false;
    }

    @Override
    public PaymentRefundResult refund(Order order, BigDecimal amount, String reason) {
        if (order.getPaymentReference() == null || order.getPaymentReference().isBlank()) {
            throw new IllegalStateException("Order has no Stripe payment reference to refund");
        }
        try {
            long amountInCents = amount
                    .multiply(BigDecimal.valueOf(100))
                    .setScale(0, RoundingMode.HALF_UP)
                    .longValue();

            RefundCreateParams params = RefundCreateParams.builder()
                    .setPaymentIntent(order.getPaymentReference())
                    .setAmount(amountInCents)
                    .setReason(RefundCreateParams.Reason.REQUESTED_BY_CUSTOMER)
                    .build();

            Refund refund = Refund.create(params);
            boolean successful = "succeeded".equalsIgnoreCase(refund.getStatus());

            return PaymentRefundResult.builder()
                    .provider("STRIPE")
                    .refundReference(refund.getId())
                    .status(refund.getStatus().toUpperCase())
                    .successful(successful)
                    .pending(!successful)
                    .message("Stripe refund " + refund.getStatus())
                    .build();
        } catch (StripeException e) {
            logger.error("Stripe refund failed for order {}", order.getOrderNumber(), e);
            throw new RuntimeException("Stripe refund failed: " + e.getMessage(), e);
        }
    }

    @Override
    public PaymentRefundResult getRefundStatus(String refundReference) {
        try {
            Refund refund = Refund.retrieve(refundReference);
            boolean successful = "succeeded".equalsIgnoreCase(refund.getStatus());
            return PaymentRefundResult.builder()
                    .provider("STRIPE")
                    .refundReference(refund.getId())
                    .status(refund.getStatus().toUpperCase())
                    .successful(successful)
                    .pending(!successful)
                    .message(refund.getStatus())
                    .build();
        } catch (StripeException e) {
            throw new RuntimeException("Failed to retrieve Stripe refund status: " + e.getMessage(), e);
        }
    }
}
