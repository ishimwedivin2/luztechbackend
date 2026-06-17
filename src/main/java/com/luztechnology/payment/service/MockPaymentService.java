package com.luztechnology.payment.service;

import com.luztechnology.notification.service.MailService;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.service.OrderService;
import com.luztechnology.payment.dto.PaymentRefundResult;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class MockPaymentService implements PaymentService {

    private static final Logger logger = LoggerFactory.getLogger(MockPaymentService.class);

    private final OrderService orderService;
    private final MailService mailService;

    @Value("${payment.mode:real}")
    private String paymentMode;

    @Override
    public boolean supports(String paymentMethod) {
        return "mock".equalsIgnoreCase(paymentMode);
    }

    @Override
    public String initiatePayment(Order order) {
        logger.info("[MOCK MODE] Processing payment instantly for Order ID: {}", order.getId());

        String mockReference = "MOCK_REF_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();

        // 1. Update Order Status
        order.setPaymentReference(mockReference);
        order.setPaymentMethod("MOCK_PAYMENT");
        orderService.updateOrderStatus(order.getId(), OrderStatus.PAID);
        logger.info("[MOCK MODE] Order {} marked as PAID with Ref: {}", order.getId(), mockReference);

        // 2. Trigger Confirmation Email via Thymeleaf template
        Map<String, Object> emailVars = new HashMap<>();
        emailVars.put("customerName", order.getCustomer().getFirstName());
        emailVars.put("orderNumber", order.getOrderNumber());
        emailVars.put("totalAmount", order.getTotalAmount());
        
        mailService.sendEmail(
                order.getCustomer().getEmail(), 
                "Order Conformation - " + order.getOrderNumber(), 
                "order-confirmation", 
                emailVars
        );

        return mockReference;
    }

    @Override
    public boolean verifyWebhook(String payload, String signature) {
        logger.info("[MOCK MODE] Auto verifying webhook payload.");
        return true;
    }

    @Override
    public PaymentRefundResult refund(Order order, BigDecimal amount, String reason) {
        String refundReference = "MOCK_REFUND_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
        logger.info("[MOCK MODE] Refunding order {} amount {} with ref {}", order.getId(), amount, refundReference);
        return PaymentRefundResult.builder()
                .provider("MOCK_PAYMENT")
                .refundReference(refundReference)
                .status("SUCCESSFUL")
                .successful(true)
                .pending(false)
                .message("Mock refund completed")
                .build();
    }

    @Override
    public PaymentRefundResult getRefundStatus(String refundReference) {
        return PaymentRefundResult.builder()
                .provider("MOCK_PAYMENT")
                .refundReference(refundReference)
                .status("SUCCESSFUL")
                .successful(true)
                .pending(false)
                .message("Mock refund completed")
                .build();
    }
}
