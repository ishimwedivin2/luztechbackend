package com.luztechnology.order.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.inventory.service.InventoryService;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderItem;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.entity.ReturnRequest;
import com.luztechnology.order.repository.ReturnRequestRepository;
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
    private static final String COMPLETED = "COMPLETED";

    private final ReturnRequestRepository returnRequestRepository;
    private final OrderService orderService;
    private final InventoryService inventoryService;

    @Transactional(readOnly = true)
    public List<ReturnRequest> getReturns(String status) {
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

    @Transactional(readOnly = true)
    public ReturnRequest getReturnByOrderId(UUID orderId) {
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
    public ReturnRequest completeReturn(UUID id, BigDecimal refundedAmount, String refundReference, String adminNotes) {
        ReturnRequest returnRequest = getReturnById(id);
        if (!APPROVED.equalsIgnoreCase(returnRequest.getStatus())) {
            throw new IllegalStateException("Only approved return requests can be completed");
        }

        BigDecimal finalRefundAmount = refundedAmount == null ? returnRequest.getRequestedAmount() : refundedAmount;
        restockOrderItems(returnRequest.getOrder());

        returnRequest.setStatus(COMPLETED);
        returnRequest.setRefundedAmount(finalRefundAmount);
        returnRequest.setRefundReference(refundReference == null || refundReference.isBlank()
                ? generateRefundReference(returnRequest.getOrder())
                : refundReference);
        returnRequest.setAdminNotes(adminNotes);
        returnRequest.setCompletedAt(LocalDateTime.now());

        orderService.updateOrderStatus(returnRequest.getOrder().getId(), OrderStatus.REFUNDED);
        return returnRequestRepository.save(returnRequest);
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
