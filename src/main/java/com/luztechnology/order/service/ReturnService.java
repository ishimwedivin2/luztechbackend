package com.luztechnology.order.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.inventory.service.InventoryService;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderItem;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.entity.ReturnRequest;
import com.luztechnology.order.repository.OrderRepository;
import com.luztechnology.order.repository.ReturnRequestRepository;
import com.luztechnology.payment.dto.PaymentRefundResult;
import com.luztechnology.payment.service.PaymentService;
import com.luztechnology.user.entity.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ReturnService {

    private static final String PENDING = "PENDING";
    private static final String APPROVED = "APPROVED";
    private static final String REJECTED = "REJECTED";
    private static final String REFUND_PENDING = "REFUND_PENDING";
    private static final String REFUND_FAILED = "REFUND_FAILED";
    private static final String COMPLETED = "COMPLETED";

    private final ReturnRequestRepository returnRequestRepository;
    private final OrderRepository orderRepository;
    private final OrderService orderService;
    private final InventoryService inventoryService;
    private final List<PaymentService> paymentServices;

    @Transactional
    public void syncRefundedOrders() {
        orderRepository.findByStatus(OrderStatus.REFUNDED).forEach(order -> {
            boolean exists = returnRequestRepository.findByOrderId(order.getId()).isPresent();
            if (!exists) {
                returnRequestRepository.save(ReturnRequest.builder()
                        .order(order)
                        .reason("Refunded by admin")
                        .status(COMPLETED)
                        .requestedAmount(order.getTotalAmount())
                        .refundedAmount(order.getTotalAmount())
                        .completedAt(order.getUpdatedAt() != null ? order.getUpdatedAt() : LocalDateTime.now())
                        .build());
            }
        });
    }

    @Transactional
    public List<ReturnRequest> getReturns(String status) {
        syncRefundedOrders();
        if (status == null) {
            return returnRequestRepository.findAll();
        }
        return returnRequestRepository.findByStatus(status.toUpperCase());
    }

    @Transactional(readOnly = true)
    public ReturnRequest getReturnById(UUID id) {
        return returnRequestRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Return request not found with id: " + id));
    }

    @Transactional
    public ReturnRequest getReturnByOrderId(UUID orderId) {
        // Ensure refunded orders always have a corresponding return record for customer lookups.
        syncRefundedOrders();
        return returnRequestRepository.findByOrderId(orderId)
                .orElseThrow(() -> new ResourceNotFoundException("Return request not found for order id: " + orderId));
    }

    @Transactional
    public ReturnRequest createReturnRequest(UUID orderId, String reason, User requester) {
        Order order = orderService.getOrderById(orderId);
        validateOrderCanBeReturned(order);
        validateRequesterCanAccessOrder(order, requester);

        returnRequestRepository.findByOrderId(orderId).ifPresent(existing -> {
            throw new IllegalStateException("A return request already exists for this order");
        });

        ReturnRequest returnRequest = ReturnRequest.builder()
                .order(order)
                .reason(reason)
                .status(PENDING)
                .requestedAmount(order.getTotalAmount())
                .build();

        orderService.updateOrderStatus(orderId, OrderStatus.RETURN_REQUESTED);
        return returnRequestRepository.save(returnRequest);
    }

    @Transactional
    public ReturnRequest approveReturn(UUID id, String adminNotes) {
        ReturnRequest returnRequest = getReturnById(id);
        if (!PENDING.equalsIgnoreCase(returnRequest.getStatus())) {
            throw new IllegalStateException("Only pending return requests can be approved");
        }
        returnRequest.setStatus(APPROVED);
        returnRequest.setAdminNotes(adminNotes);
        returnRequest.setApprovedAt(LocalDateTime.now());
        return returnRequestRepository.save(returnRequest);
    }

    @Transactional
    public ReturnRequest rejectReturn(UUID id, String adminNotes) {
        ReturnRequest returnRequest = getReturnById(id);
        if (!PENDING.equalsIgnoreCase(returnRequest.getStatus())) {
            throw new IllegalStateException("Only pending return requests can be rejected");
        }
        returnRequest.setStatus(REJECTED);
        returnRequest.setAdminNotes(adminNotes);
        orderService.updateOrderStatus(returnRequest.getOrder().getId(), OrderStatus.DELIVERED);
        return returnRequestRepository.save(returnRequest);
    }

    @Transactional
    public ReturnRequest initiateRefund(UUID id, BigDecimal refundedAmount, String adminNotes) {
        ReturnRequest returnRequest = getReturnById(id);
        if (!APPROVED.equalsIgnoreCase(returnRequest.getStatus())) {
            throw new IllegalStateException("Only approved return requests can be refunded");
        }

        Order order = returnRequest.getOrder();
        if (order.getPaymentMethod() == null || order.getPaymentMethod().isBlank()) {
            throw new IllegalStateException("Order has no payment method for provider refund");
        }

        BigDecimal finalRefundAmount = refundedAmount == null ? returnRequest.getRequestedAmount() : refundedAmount;
        PaymentService paymentService = paymentServices.stream()
                .filter(service -> service.supportsRefund(order.getPaymentMethod()))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Refunds are not supported for payment method: " + order.getPaymentMethod()));

        PaymentRefundResult result = paymentService.refund(order, finalRefundAmount, returnRequest.getReason());
        returnRequest.setRefundProvider(result.getProvider());
        returnRequest.setRefundReference(result.getRefundReference());
        returnRequest.setRefundStatus(result.getStatus());
        returnRequest.setRefundedAmount(finalRefundAmount);
        returnRequest.setAdminNotes(adminNotes);
        returnRequest.setRefundRequestedAt(LocalDateTime.now());

        if (result.isSuccessful()) {
            completeSuccessfulRefund(returnRequest, finalRefundAmount);
        } else if (result.isPending()) {
            returnRequest.setStatus(REFUND_PENDING);
        } else {
            returnRequest.setStatus(REFUND_FAILED);
        }

        return returnRequestRepository.save(returnRequest);
    }

    @Transactional
    public ReturnRequest syncRefundStatus(UUID id) {
        ReturnRequest returnRequest = getReturnById(id);
        if (returnRequest.getRefundProvider() == null || returnRequest.getRefundReference() == null) {
            throw new IllegalStateException("Return request does not have a provider refund to check");
        }

        PaymentService paymentService = paymentServices.stream()
                .filter(service -> service.supportsRefund(returnRequest.getRefundProvider()))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Refund status is not supported for provider: " + returnRequest.getRefundProvider()));

        PaymentRefundResult result = paymentService.getRefundStatus(returnRequest.getRefundReference());
        returnRequest.setRefundStatus(result.getStatus());

        if (result.isSuccessful()) {
            completeSuccessfulRefund(returnRequest, returnRequest.getRefundedAmount());
        } else if (result.isPending()) {
            returnRequest.setStatus(REFUND_PENDING);
        } else {
            returnRequest.setStatus(REFUND_FAILED);
        }

        return returnRequestRepository.save(returnRequest);
    }

    @Transactional
    public ReturnRequest completeReturn(UUID id, BigDecimal refundedAmount, String refundReference, String adminNotes) {
        ReturnRequest returnRequest = getReturnById(id);
        if (!APPROVED.equalsIgnoreCase(returnRequest.getStatus())) {
            throw new IllegalStateException("Only approved return requests can be completed");
        }

        BigDecimal finalRefundAmount = refundedAmount == null ? returnRequest.getRequestedAmount() : refundedAmount;
        returnRequest.setStatus(COMPLETED);
        returnRequest.setRefundedAmount(finalRefundAmount);
        returnRequest.setRefundReference(refundReference == null || refundReference.isBlank()
                ? generateRefundReference(returnRequest.getOrder())
                : refundReference);
        returnRequest.setRefundProvider("MANUAL");
        returnRequest.setRefundStatus("SUCCESSFUL");
        returnRequest.setAdminNotes(adminNotes);
        completeSuccessfulRefund(returnRequest, finalRefundAmount);

        return returnRequestRepository.save(returnRequest);
    }

    private void completeSuccessfulRefund(ReturnRequest returnRequest, BigDecimal refundedAmount) {
        if (!COMPLETED.equalsIgnoreCase(returnRequest.getStatus())) {
            restockOrderItems(returnRequest.getOrder());
        }
        returnRequest.setStatus(COMPLETED);
        returnRequest.setRefundStatus("SUCCESSFUL");
        returnRequest.setRefundedAmount(refundedAmount);
        returnRequest.setCompletedAt(LocalDateTime.now());
        orderService.updateOrderStatus(returnRequest.getOrder().getId(), OrderStatus.REFUNDED);
    }

    private void validateOrderCanBeReturned(Order order) {
        if (order.getStatus() != OrderStatus.DELIVERED && order.getStatus() != OrderStatus.PAID) {
            throw new IllegalStateException("Only paid or delivered orders can be returned");
        }
    }

    private void validateRequesterCanAccessOrder(Order order, User requester) {
        if (requester == null || requester.getRoles().stream().anyMatch(role ->
                "ROLE_ADMIN".equals(role.getName()) || "ROLE_EMPLOYEE".equals(role.getName()))) {
            return;
        }
        if (order.getCustomer() == null || !order.getCustomer().getId().equals(requester.getId())) {
            throw new IllegalStateException("You can only request returns for your own orders");
        }
    }

    private void restockOrderItems(Order order) {
        for (OrderItem item : order.getOrderItems()) {
            if (item.getProduct().getInventoryItem() == null) {
                continue;
            }
            inventoryService.adjustStock(
                    item.getProduct().getInventoryItem().getId(),
                    item.getQuantity(),
                    "Return completed",
                    "RETURN",
                    order.getOrderNumber());
        }
    }

    private String generateRefundReference(Order order) {
        return "REFUND-" + order.getOrderNumber() + "-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}
