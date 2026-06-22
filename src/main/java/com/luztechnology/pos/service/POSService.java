package com.luztechnology.pos.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.order.dto.OrderRequestDTO;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderItem;
import com.luztechnology.order.repository.OrderRepository;
import com.luztechnology.order.service.OrderService;
import com.luztechnology.pos.dto.POSCheckoutRequest;
import com.luztechnology.pos.dto.POSHistoryResponse;
import com.luztechnology.pos.dto.POSReceiptLineResponse;
import com.luztechnology.pos.dto.POSReceiptResponse;
import com.luztechnology.pos.dto.POSSummaryResponse;
import com.luztechnology.security.services.UserDetailsImpl;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class POSService {

    private static final String POS_CHANNEL = "POS";
    private static final String POS_ADDRESS = "In-store purchase";

    private final OrderService orderService;
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;

    @Transactional
    public POSReceiptResponse checkout(UserDetailsImpl cashierDetails, POSCheckoutRequest request) {
        User cashier = userRepository.findById(cashierDetails.getId())
                .orElseThrow(() -> new ResourceNotFoundException("Cashier not found"));
        User customer = request.getCustomerId() == null ? null
                : userRepository.findById(request.getCustomerId())
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
    public POSReceiptResponse getReceipt(UUID orderId) {
        return toReceipt(orderService.getOrderById(orderId));
    }

    @Transactional(readOnly = true)
    public Page<POSHistoryResponse> getHistory(int page, int size) {
        PageRequest pageable = PageRequest.of(page, size, Sort.by(Sort.Direction.DESC, "createdAt"));
        return orderRepository.findByOrderChannelOrderByCreatedAtDesc(POS_CHANNEL, pageable)
                .map(this::toHistoryResponse);
    }

    @Transactional(readOnly = true)
    public POSSummaryResponse getSummary(LocalDate startDate, LocalDate endDate) {
        LocalDateTime start = startDate.atStartOfDay();
        LocalDateTime end = endDate.plusDays(1).atStartOfDay();
        List<Order> orders = orderRepository.findByOrderChannelAndCreatedAtBetween(POS_CHANNEL, start, end);

        BigDecimal totalRevenue = orders.stream()
                .map(o -> o.getTotalAmount() == null ? BigDecimal.ZERO : o.getTotalAmount())
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal avgValue = orders.isEmpty()
                ? BigDecimal.ZERO
                : totalRevenue.divide(BigDecimal.valueOf(orders.size()), 2, RoundingMode.HALF_UP);

        Map<String, Long> paymentMethodBreakdown = orders.stream()
                .collect(Collectors.groupingBy(
                        o -> o.getPaymentMethod() == null ? "UNKNOWN" : o.getPaymentMethod(),
                        Collectors.counting()));

        Map<String, BigDecimal> paymentMethodRevenue = orders.stream()
                .collect(Collectors.groupingBy(
                        o -> o.getPaymentMethod() == null ? "UNKNOWN" : o.getPaymentMethod(),
                        Collectors.reducing(BigDecimal.ZERO,
                                o -> o.getTotalAmount() == null ? BigDecimal.ZERO : o.getTotalAmount(),
                                BigDecimal::add)));

        return POSSummaryResponse.builder()
                .startDate(startDate)
                .endDate(endDate)
                .totalTransactions(orders.size())
                .totalRevenue(totalRevenue)
                .averageTransactionValue(avgValue)
                .paymentMethodBreakdown(paymentMethodBreakdown)
                .paymentMethodRevenue(paymentMethodRevenue)
                .build();
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

    private POSHistoryResponse toHistoryResponse(Order order) {
        return POSHistoryResponse.builder()
                .orderId(order.getId())
                .orderNumber(order.getOrderNumber())
                .cashierEmail(order.getCashier() == null ? null : order.getCashier().getEmail())
                .customerEmail(order.getCustomer() == null ? "Walk-in customer" : order.getCustomer().getEmail())
                .paymentMethod(order.getPaymentMethod())
                .paymentReference(order.getPaymentReference())
                .totalAmount(order.getTotalAmount())
                .itemCount(order.getOrderItems() == null ? 0 : order.getOrderItems().size())
                .soldAt(order.getCreatedAt())
                .build();
    }
}
