package com.luztechnology.order.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.order.dto.OrderRequestDTO;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderItem;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.repository.OrderRepository;
import com.luztechnology.product.repository.ProductRepository;
import com.luztechnology.user.repository.UserRepository;
import com.luztechnology.security.services.UserDetailsImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class OrderService {

    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    private final com.luztechnology.notification.service.NotificationService notificationService;
    private final com.luztechnology.crm.service.CRMService crmService;

    @Transactional(readOnly = true)
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Order getOrderById(UUID id) {
        return orderRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Order not found with id: " + id));
    }

    @Transactional(readOnly = true)
    public List<Order> getOrdersByCustomer(UUID customerId) {
        return orderRepository.findByCustomerId(customerId);
    }

    @Transactional
    public Order processOrder(OrderRequestDTO request) {
        UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();

        Order order = Order.builder()
                .orderNumber("LUZ-" + System.currentTimeMillis())
                .customer(userRepository.findById(userDetails.getId()).orElseThrow())
                .status(OrderStatus.PENDING)
                .totalAmount(request.getTotalAmount())
                .shippingAddress(request.getShippingAddress())
                .paymentMethod(request.getPaymentMethod())
                .build();

        List<OrderItem> items = request.getItems().stream().map(dto -> {
            OrderItem item = OrderItem.builder()
                    .order(order)
                    .product(productRepository.findById(dto.getProductId()).orElseThrow())
                    .quantity(dto.getQuantity())
                    .unitPrice(dto.getUnitPrice())
                    .subTotal(dto.getUnitPrice().multiply(BigDecimal.valueOf(dto.getQuantity())))
                    .build();
            return item;
        }).collect(Collectors.toList());

        order.setOrderItems(items);
        return orderRepository.save(order);
    }

    @Transactional
    public Order createOrder(Order order) {
        if (order.getOrderNumber() == null) {
            order.setOrderNumber("LUZ-TEMP-" + UUID.randomUUID().toString().substring(0, 8));
        }
        order.setStatus(OrderStatus.CREATED);
        return orderRepository.save(order);
    }

    @Transactional
    public Order updateOrderStatus(UUID id, OrderStatus newStatus) {
        Order order = getOrderById(id);
        order.setStatus(newStatus);
        Order savedOrder = orderRepository.save(order);

        // Notify via WebSocket and persistence
        notificationService.sendOrderStatusUpdate(savedOrder.getCustomer(), savedOrder.getId(), newStatus.name());

        // If PAID, update CRM profile
        if (newStatus == OrderStatus.PAID) {
            crmService.updateCustomerProfile(savedOrder.getCustomer().getId(), savedOrder.getTotalAmount());
        }

        return savedOrder;
    }

    @Transactional
    public Order cancelOrder(UUID id) {
        Order order = getOrderById(id);
        if (order.getStatus() == OrderStatus.SHIPPED || order.getStatus() == OrderStatus.DELIVERED) {
            throw new IllegalStateException("Cannot cancel an order that has already been shipped or delivered.");
        }
        order.setStatus(OrderStatus.CANCELLED);
        return orderRepository.save(order);
    }
}
