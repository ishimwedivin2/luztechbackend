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
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

        PaymentStatusResponse response = PaymentStatusResponse.builder()
                .orderId(order.getId())
                .orderNumber(order.getOrderNumber())
                .orderStatus(immediatelyPaid ? "PAID" : "PROCESSING")
                .paymentMethod(paymentMethod)
                .paymentReference(paymentReference)
                .paid(immediatelyPaid)
                .totalAmount(order.getTotalAmount())
                .message(immediatelyPaid
                        ? "Payment confirmed successfully"
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
}
