package com.luztechnology.order.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.inventory.service.InventoryService;
import com.luztechnology.finance.service.TaxService;
import com.luztechnology.order.dto.OrderRequestDTO;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderItem;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.repository.OrderRepository;
import com.luztechnology.product.entity.Product;
import com.luztechnology.product.entity.ProductStatus;
import com.luztechnology.product.repository.ProductRepository;
import com.luztechnology.user.repository.UserRepository;
import com.luztechnology.security.services.UserDetailsImpl;
import com.luztechnology.user.entity.User;
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
    private final InventoryService inventoryService;
    private final TaxService taxService;

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

        User customer = userRepository.findById(userDetails.getId()).orElseThrow();
        return processOrderForCustomer(customer, request);
    }

    @Transactional
    public Order processOrderForCustomer(User customer, OrderRequestDTO request) {
        return createOrderFromRequest(request, customer, null, OrderStatus.PENDING, "ONLINE", null);
    }

    @Transactional
    public Order processPosOrder(OrderRequestDTO request, User cashier, User customer, String paymentReference) {
        return createOrderFromRequest(request, customer, cashier, OrderStatus.PAID, "POS", paymentReference);
    }

    private Order createOrderFromRequest(
            OrderRequestDTO request,
            User customer,
            User cashier,
            OrderStatus status,
            String orderChannel,
            String paymentReference) {

        Order order = Order.builder()
                .orderNumber("LUZ-" + System.currentTimeMillis())
                .customer(customer)
                .cashier(cashier)
                .status(status)
                .subTotalAmount(BigDecimal.ZERO)
                .taxAmount(BigDecimal.ZERO)
                .taxRate(taxService.getTaxRate())
                .totalAmount(BigDecimal.ZERO)
                .shippingAddress(request.getShippingAddress())
                .billingAddress(request.getBillingAddress())
                .paymentMethod(request.getPaymentMethod())
                .paymentReference(paymentReference)
                .orderChannel(orderChannel)
                .build();

        List<OrderItem> items = request.getItems().stream().map(dto -> {
            Product product = productRepository.findById(dto.getProductId())
                    .orElseThrow(() -> new ResourceNotFoundException("Product not found with id: " + dto.getProductId()));
            if (product.getStatus() != ProductStatus.ACTIVE) {
                throw new IllegalStateException("Product is not available for purchase: " + product.getName());
            }
            BigDecimal unitPrice = product.getPrice();
            OrderItem item = OrderItem.builder()
                    .order(order)
                    .product(product)
                    .quantity(dto.getQuantity())
                    .unitPrice(unitPrice)
                    .subTotal(unitPrice.multiply(BigDecimal.valueOf(dto.getQuantity())))
                    .build();
            reduceInventoryIfLinked(product, dto.getQuantity(), order.getOrderNumber());
            return item;
        }).collect(Collectors.toList());

        order.setOrderItems(items);
        BigDecimal subTotal = items.stream()
                .map(OrderItem::getSubTotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal taxAmount = taxService.calculateTax(subTotal);

        order.setSubTotalAmount(subTotal);
        order.setTaxAmount(taxAmount);
        order.setTotalAmount(subTotal.add(taxAmount));

        Order savedOrder = orderRepository.save(order);
        if (savedOrder.getStatus() == OrderStatus.PAID) {
            taxService.recordTaxForPaidOrder(savedOrder);
        }
        return savedOrder;
    }

    private void reduceInventoryIfLinked(Product product, Integer quantity, String orderNumber) {
        if (product.getInventoryItem() == null) {
            return;
        }

        inventoryService.adjustStock(
                product.getInventoryItem().getId(),
                -quantity,
                "Sale completed",
                "SALE",
                orderNumber);
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

        // Notify online customers via WebSocket and persistence.
        if (savedOrder.getCustomer() != null) {
            notificationService.sendOrderStatusUpdate(savedOrder.getCustomer(), savedOrder.getId(), newStatus.name());
        }

        // If PAID, update CRM profile
        if (newStatus == OrderStatus.PAID && savedOrder.getCustomer() != null) {
            crmService.updateCustomerProfile(savedOrder.getCustomer().getId(), savedOrder.getTotalAmount());
        }

        if (newStatus == OrderStatus.PAID) {
            taxService.recordTaxForPaidOrder(savedOrder);
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
