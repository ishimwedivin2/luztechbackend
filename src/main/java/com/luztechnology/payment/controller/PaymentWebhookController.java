package com.luztechnology.payment.controller;

import com.luztechnology.cart.service.CartService;
import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.service.OrderService;
import com.luztechnology.payment.dto.PaymentStatusResponse;
import com.luztechnology.payment.entity.PaymentTransaction;
import com.luztechnology.payment.service.MTNPaymentService;
import com.luztechnology.payment.service.PaymentReconciliationService;
import com.luztechnology.payment.service.PaymentService;
import com.luztechnology.payment.service.StripePaymentService;
import com.stripe.exception.StripeException;
import com.stripe.model.Event;
import com.stripe.model.PaymentIntent;
import com.stripe.net.Webhook;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping("/api/payments")
@RequiredArgsConstructor
public class PaymentWebhookController {

    private static final Logger logger = LoggerFactory.getLogger(PaymentWebhookController.class);

    private final List<PaymentService> paymentServices;
    private final OrderService orderService;
    private final PaymentReconciliationService reconciliationService;
    private final CartService cartService;

    @Value("${payment.stripe.webhook-secret:whsec_placeholder}")
    private String stripeWebhookSecret;

    @PostMapping("/initiate/{orderId}")
    public ResponseEntity<ApiResponse<PaymentStatusResponse>> initiatePayment(
            @PathVariable UUID orderId,
            @RequestParam String paymentMethod) {

        Order order = orderService.getOrderById(orderId);

        PaymentService selectedService = paymentServices.stream()
                .filter(service -> service.supports(paymentMethod))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Unsupported payment method: " + paymentMethod));

        String paymentReference = selectedService.initiatePayment(order);
        order = orderService.updatePaymentDetails(orderId, paymentMethod, paymentReference);

        boolean immediatelyPaid = selectedService.isImmediateConfirmation();
        if (immediatelyPaid) {
            order = orderService.updateOrderStatus(orderId, OrderStatus.PAID);
            reconciliationService.recordInitiated(order, paymentMethod, paymentReference);
            reconciliationService.recordWebhook(order, paymentMethod, true);
            if (order.getCustomer() != null) {
                cartService.clearCart(order.getCustomer());
            }
            logger.info("Order {} immediately confirmed as PAID via {}", orderId, paymentMethod);
        } else {
            orderService.updateOrderStatus(orderId, OrderStatus.PROCESSING);
            reconciliationService.recordInitiated(order, paymentMethod, paymentReference);
            logger.info("Order {} set to PROCESSING, awaiting {} webhook", orderId, paymentMethod);
        }

        // For Stripe, paymentReference holds the client_secret — expose it separately
        boolean isStripe = "STRIPE".equalsIgnoreCase(paymentMethod);
        String clientSecret = isStripe ? paymentReference : null;
        String publicReference = isStripe ? null : paymentReference;

        PaymentStatusResponse response = PaymentStatusResponse.builder()
                .orderId(order.getId())
                .orderNumber(order.getOrderNumber())
                .orderStatus(immediatelyPaid ? "PAID" : "PROCESSING")
                .paymentMethod(paymentMethod)
                .paymentReference(publicReference)
                .clientSecret(clientSecret)
                .paid(immediatelyPaid)
                .totalAmount(order.getTotalAmount())
                .message(immediatelyPaid
                        ? "Payment confirmed successfully"
                        : isStripe
                            ? "Use the clientSecret to confirm payment with Stripe.js"
                            : "Payment initiated — please approve on your device")
                .build();

        return ResponseEntity.ok(ApiResponse.success("Payment initiated", response));
    }

    /**
     * Polling endpoint: frontend calls this every few seconds to check if MTN
     * confirmed payment. For immediate-confirmation providers it always returns paid=true.
     */
    @GetMapping("/status/{orderId}")
    public ResponseEntity<ApiResponse<PaymentStatusResponse>> getPaymentStatus(@PathVariable UUID orderId) {
        Order order = orderService.getOrderById(orderId);
        boolean alreadyPaid = order.getStatus() == OrderStatus.PAID
                || order.getStatus() == OrderStatus.SHIPPED
                || order.getStatus() == OrderStatus.DELIVERED;

        if (!alreadyPaid && "MTN_MOMO".equalsIgnoreCase(order.getPaymentMethod())) {
            // Actively poll MTN for the latest status
            Optional<PaymentTransaction> txOpt = reconciliationService
                    .getTransactions(orderId)
                    .stream()
                    .findFirst();

            if (txOpt.isPresent()) {
                String ref = txOpt.get().getPaymentReference();
                MTNPaymentService mtn = paymentServices.stream()
                        .filter(s -> s instanceof MTNPaymentService)
                        .map(s -> (MTNPaymentService) s)
                        .findFirst()
                        .orElse(null);

                if (mtn != null && ref != null) {
                    try {
                        // verifyWebhook doubles as a status check — pass the reference as payload
                        String payload = "{\"referenceId\":\"" + ref + "\"}";
                        boolean confirmed = mtn.verifyWebhook(payload, null);
                        if (confirmed) {
                            order = orderService.updateOrderStatus(orderId, OrderStatus.PAID);
                            reconciliationService.recordWebhook(order, "MTN_MOMO", true);
                            if (order.getCustomer() != null) {
                                cartService.clearCart(order.getCustomer());
                            }
                            alreadyPaid = true;
                            logger.info("MTN status poll confirmed PAID for order {}", orderId);
                        }
                    } catch (Exception e) {
                        logger.warn("MTN status poll failed for order {}: {}", orderId, e.getMessage());
                    }
                }
            }
        }

        PaymentStatusResponse response = PaymentStatusResponse.builder()
                .orderId(order.getId())
                .orderNumber(order.getOrderNumber())
                .orderStatus(order.getStatus().name())
                .paymentMethod(order.getPaymentMethod())
                .paymentReference(order.getPaymentReference())
                .paid(alreadyPaid)
                .totalAmount(order.getTotalAmount())
                .message(alreadyPaid ? "Payment confirmed" : "Awaiting payment confirmation")
                .build();

        return ResponseEntity.ok(ApiResponse.success("Payment status retrieved", response));
    }

    /**
     * Called by frontend immediately after Stripe.js confirmCardPayment succeeds.
     * Verifies the PaymentIntent server-side with Stripe API (no CLI/webhook needed).
     */
    @PostMapping("/stripe/confirm/{orderId}")
    public ResponseEntity<ApiResponse<PaymentStatusResponse>> confirmStripePayment(
            @PathVariable UUID orderId,
            @RequestParam String paymentIntentId) {
        try {
            PaymentIntent intent = PaymentIntent.retrieve(paymentIntentId);
            if (!"succeeded".equals(intent.getStatus())) {
                return ResponseEntity.badRequest()
                        .body(ApiResponse.error("Payment not confirmed by Stripe: " + intent.getStatus()));
            }
            Order order = orderService.getOrderById(orderId);
            if (order.getStatus() == OrderStatus.PAID) {
                // Already processed (e.g. webhook arrived first)
                PaymentStatusResponse resp = PaymentStatusResponse.builder()
                        .orderId(order.getId()).orderNumber(order.getOrderNumber())
                        .orderStatus("PAID").paid(true).totalAmount(order.getTotalAmount())
                        .message("Payment already confirmed").build();
                return ResponseEntity.ok(ApiResponse.success("Already paid", resp));
            }
            orderService.updatePaymentDetails(orderId, "STRIPE", intent.getId());
            Order paidOrder = orderService.updateOrderStatus(orderId, OrderStatus.PAID);
            reconciliationService.recordWebhook(paidOrder, "STRIPE", true);
            if (paidOrder.getCustomer() != null) cartService.clearCart(paidOrder.getCustomer());
            logger.info("Stripe payment confirmed server-side for order {}", orderId);

            PaymentStatusResponse resp = PaymentStatusResponse.builder()
                    .orderId(paidOrder.getId()).orderNumber(paidOrder.getOrderNumber())
                    .orderStatus("PAID").paid(true).totalAmount(paidOrder.getTotalAmount())
                    .message("Payment confirmed successfully").build();
            return ResponseEntity.ok(ApiResponse.success("Payment confirmed", resp));
        } catch (StripeException e) {
            logger.error("Stripe server-side confirmation failed for order {}", orderId, e);
            return ResponseEntity.badRequest().body(ApiResponse.error("Stripe verification failed: " + e.getMessage()));
        }
    }

    @PostMapping("/webhook/{provider}")
    public ResponseEntity<ApiResponse<String>> handleWebhook(
            @PathVariable String provider,
            @RequestBody String payload,
            @RequestHeader(value = "X-Signature", required = false) String signature,
            @RequestParam UUID orderId) {

        PaymentService selectedService = paymentServices.stream()
                .filter(service -> service.supports(provider))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Unknown provider webhook: " + provider));

        boolean isVerified = selectedService.verifyWebhook(payload, signature);

        if (isVerified) {
            Order paidOrder = orderService.updateOrderStatus(orderId, OrderStatus.PAID);
            reconciliationService.recordWebhook(paidOrder, provider, true);
            if (paidOrder.getCustomer() != null) {
                cartService.clearCart(paidOrder.getCustomer());
            }
            logger.info("Order {} marked as PAID via {} webhook", orderId, provider);
            return ResponseEntity.ok(ApiResponse.success("Webhook processed successfully", null));
        } else {
            reconciliationService.recordWebhook(orderService.getOrderById(orderId), provider, false);
            logger.error("Failed to verify webhook payload for provider {}", provider);
            return ResponseEntity.badRequest().body(ApiResponse.error("Invalid webhook signature or payload"));
        }
    }

    /**
     * Stripe sends events here. Configure this URL in Stripe Dashboard:
     * https://dashboard.stripe.com/webhooks  →  POST /api/payments/webhook/stripe
     */
    @PostMapping("/webhook/stripe")
    public ResponseEntity<String> handleStripeWebhook(
            @RequestBody String payload,
            @RequestHeader("Stripe-Signature") String sigHeader) {
        try {
            Event event = Webhook.constructEvent(payload, sigHeader, stripeWebhookSecret);

            if ("payment_intent.succeeded".equals(event.getType())) {
                PaymentIntent intent = (PaymentIntent) event.getDataObjectDeserializer()
                        .getObject().orElseThrow();
                String orderIdStr = intent.getMetadata().get("orderId");
                if (orderIdStr != null) {
                    UUID orderId = UUID.fromString(orderIdStr);
                    orderService.updatePaymentDetails(orderId, "STRIPE", intent.getId());
                    Order paidOrder = orderService.updateOrderStatus(orderId, OrderStatus.PAID);
                    reconciliationService.recordWebhook(paidOrder, "STRIPE", true);
                    if (paidOrder.getCustomer() != null) cartService.clearCart(paidOrder.getCustomer());
                    logger.info("Stripe payment_intent.succeeded — order {} marked PAID", orderId);
                }
            } else if ("payment_intent.payment_failed".equals(event.getType())) {
                PaymentIntent intent = (PaymentIntent) event.getDataObjectDeserializer()
                        .getObject().orElseThrow();
                String orderIdStr = intent.getMetadata().get("orderId");
                if (orderIdStr != null) {
                    UUID orderId = UUID.fromString(orderIdStr);
                    Order order = orderService.getOrderById(orderId);
                    reconciliationService.recordWebhook(order, "STRIPE", false);
                    logger.warn("Stripe payment failed for order {}", orderId);
                }
            }
            return ResponseEntity.ok("received");
        } catch (Exception e) {
            logger.error("Stripe webhook error", e);
            return ResponseEntity.badRequest().body("Webhook error: " + e.getMessage());
        }
    }
}
