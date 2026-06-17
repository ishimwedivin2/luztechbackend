package com.luztechnology.payment.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.service.OrderService;
import com.luztechnology.payment.service.PaymentReconciliationService;
import com.luztechnology.payment.service.PaymentService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/payments")
@RequiredArgsConstructor
public class PaymentWebhookController {

    private static final Logger logger = LoggerFactory.getLogger(PaymentWebhookController.class);

    private final List<PaymentService> paymentServices;
    private final OrderService orderService;
    private final PaymentReconciliationService reconciliationService;

    @PostMapping("/initiate/{orderId}")
    public ResponseEntity<ApiResponse<String>> initiatePayment(
            @PathVariable UUID orderId, 
            @RequestParam String paymentMethod) {
        
        Order order = orderService.getOrderById(orderId);
        
        PaymentService selectedService = paymentServices.stream()
                .filter(service -> service.supports(paymentMethod))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Unsupported payment method: " + paymentMethod));

        String paymentReference = selectedService.initiatePayment(order);
        
        order = orderService.updatePaymentDetails(orderId, paymentMethod, paymentReference);
        orderService.updateOrderStatus(orderId, OrderStatus.PROCESSING); // Or keep it CREATED until webhook
        reconciliationService.recordInitiated(order, paymentMethod, paymentReference);
        
        return ResponseEntity.ok(ApiResponse.success("Payment initiated", paymentReference));
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
            orderService.updateOrderStatus(orderId, OrderStatus.PAID);
            reconciliationService.recordWebhook(orderService.getOrderById(orderId), provider, true);
            logger.info("Order {} marked as PAID successfully after {} webhook", orderId, provider);
            // Handle invoice generation and emailing 
            return ResponseEntity.ok(ApiResponse.success("Webhook processed successfully", null));
        } else {
            reconciliationService.recordWebhook(orderService.getOrderById(orderId), provider, false);
            logger.error("Failed to verify webhook payload for provider {}", provider);
            return ResponseEntity.badRequest().body(ApiResponse.error("Invalid webhook signature or payload"));
        }
    }
}
