package com.luztechnology.pos.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.order.dto.OrderRequestDTO;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderItem;
import com.luztechnology.order.service.OrderService;
import com.luztechnology.pos.dto.POSCheckoutRequest;
import com.luztechnology.pos.dto.POSReceiptLineResponse;
import com.luztechnology.pos.dto.POSReceiptResponse;
import com.luztechnology.security.services.UserDetailsImpl;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class POSService {

    private static final String POS_ADDRESS = "In-store purchase";

    private final OrderService orderService;
    private final UserRepository userRepository;

    @Transactional
    public POSReceiptResponse checkout(UserDetailsImpl cashierDetails, POSCheckoutRequest request) {
        User cashier = userRepository.findById(cashierDetails.getId())
                .orElseThrow(() -> new ResourceNotFoundException("Cashier not found"));
        User customer = request.getCustomerId() == null ? null : userRepository.findById(request.getCustomerId())
                .orElseThrow(() -> new ResourceNotFoundException("Customer not found"));

        OrderRequestDTO orderRequest = new OrderRequestDTO();
        orderRequest.setShippingAddress(POS_ADDRESS);
        orderRequest.setBillingAddress(POS_ADDRESS);
        orderRequest.setPaymentMethod(request.getPaymentMethod());
        orderRequest.setItems(request.getItems().stream()
                .map(item -> {
                    OrderRequestDTO.OrderItemDTO dto = new OrderRequestDTO.OrderItemDTO();
                    dto.setProductId(item.getProductId());
                    dto.setQuantity(item.getQuantity());
                    return dto;
                })
                .toList());

        Order order = orderService.processPosOrder(orderRequest, cashier, customer, request.getPaymentReference());
        return toReceipt(order);
    }

    @Transactional(readOnly = true)
    public POSReceiptResponse getReceipt(java.util.UUID orderId) {
        return toReceipt(orderService.getOrderById(orderId));
    }

    private POSReceiptResponse toReceipt(Order order) {
        List<POSReceiptLineResponse> items = order.getOrderItems().stream()
                .map(this::toReceiptLine)
                .toList();

        return POSReceiptResponse.builder()
                .orderId(order.getId())
                .orderNumber(order.getOrderNumber())
                .cashierEmail(order.getCashier() == null ? null : order.getCashier().getEmail())
                .customerEmail(order.getCustomer() == null ? "Walk-in customer" : order.getCustomer().getEmail())
                .paymentMethod(order.getPaymentMethod())
                .paymentReference(order.getPaymentReference())
                .totalAmount(order.getTotalAmount())
                .soldAt(order.getCreatedAt())
                .items(items)
                .build();
    }

    private POSReceiptLineResponse toReceiptLine(OrderItem item) {
        return POSReceiptLineResponse.builder()
                .productId(item.getProduct().getId())
                .productName(item.getProduct().getName())
                .sku(item.getProduct().getSku())
                .quantity(item.getQuantity())
                .unitPrice(item.getUnitPrice())
                .subTotal(item.getSubTotal())
                .build();
    }
}
