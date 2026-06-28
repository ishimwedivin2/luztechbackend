package com.luztechnology.order.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.inventory.service.InventoryService;
import com.luztechnology.finance.service.TaxService;
import com.luztechnology.notification.service.MailService;
import com.luztechnology.order.dto.OrderRequestDTO;
import com.luztechnology.order.dto.OrderTrackingEventResponse;
import com.luztechnology.order.dto.OrderTrackingResponse;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderItem;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.entity.OrderTrackingEvent;
import com.luztechnology.order.entity.ReturnRequest;
import com.luztechnology.order.entity.Shipment;
import com.luztechnology.order.repository.OrderRepository;
import com.luztechnology.order.repository.OrderTrackingEventRepository;
import com.luztechnology.order.repository.ReturnRequestRepository;
import com.luztechnology.order.repository.ShipmentRepository;
import com.luztechnology.product.entity.Product;
import com.luztechnology.product.entity.ProductStatus;
import com.luztechnology.product.repository.ProductRepository;
import com.luztechnology.user.repository.UserRepository;
import com.luztechnology.security.services.UserDetailsImpl;
import com.luztechnology.user.entity.User;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class OrderService {

    private static final Logger logger = LoggerFactory.getLogger(OrderService.class);

    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    private final com.luztechnology.notification.service.NotificationService notificationService;
    private final com.luztechnology.crm.service.CRMService crmService;
    private final InventoryService inventoryService;
    private final TaxService taxService;
    private final MailService mailService;
    private final OrderTrackingEventRepository trackingEventRepository;
    private final ShipmentRepository shipmentRepository;
    private final ReturnRequestRepository returnRequestRepository;

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

    @Transactional(readOnly = true)
    public List<com.luztechnology.order.dto.CustomerOrderResponse> getCustomerOrderDtos(UUID customerId) {
        return orderRepository.findByCustomerId(customerId).stream()
                .map(this::toCustomerOrderResponse)
                .collect(Collectors.toList());
    }

    private com.luztechnology.order.dto.CustomerOrderResponse toCustomerOrderResponse(Order o) {
        List<com.luztechnology.order.dto.OrderItemResponse> items = o.getOrderItems().stream().map(item -> {
            Product p = item.getProduct();
            String imageUrl = "";
            if (p != null && p.getImages() != null) {
                imageUrl = p.getImages().stream()
                        .filter(img -> img.isPrimary())
                        .findFirst()
                        .map(img -> img.getUrl())
                        .orElse(p.getImages().isEmpty() ? "" : p.getImages().get(0).getUrl());
            }
            return com.luztechnology.order.dto.OrderItemResponse.builder()
                    .productId(p != null ? p.getId() : null)
                    .productName(p != null ? p.getName() : "—")
                    .imageUrl(imageUrl)
                    .quantity(item.getQuantity())
                    .unitPrice(item.getUnitPrice())
                    .subTotal(item.getSubTotal())
                    .build();
        }).collect(Collectors.toList());

        return com.luztechnology.order.dto.CustomerOrderResponse.builder()
                .id(o.getId())
                .orderNumber(o.getOrderNumber())
                .status(o.getStatus().name())
                .subTotalAmount(o.getSubTotalAmount())
                .taxAmount(o.getTaxAmount())
                .taxRate(o.getTaxRate())
                .totalAmount(o.getTotalAmount())
                .paymentMethod(o.getPaymentMethod())
                .paymentReference(o.getPaymentReference())
                .shippingAddress(o.getShippingAddress())
                .createdAt(o.getCreatedAt())
                .orderItems(items)
                .build();
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
                .discountAmount(BigDecimal.ZERO)
                .couponCode(request.getCouponCode())
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

        BigDecimal discountAmount = request.getDiscountAmount() != null
                ? request.getDiscountAmount().min(subTotal).max(BigDecimal.ZERO)
                : BigDecimal.ZERO;
        BigDecimal discountedSubTotal = subTotal.subtract(discountAmount);
        BigDecimal taxAmount = taxService.calculateTax(discountedSubTotal);

        order.setSubTotalAmount(subTotal);
        order.setDiscountAmount(discountAmount);
        order.setTaxAmount(taxAmount);
        order.setTotalAmount(discountedSubTotal.add(taxAmount));

        Order savedOrder = orderRepository.save(order);
        recordTrackingEvent(savedOrder, savedOrder.getStatus(), buildTrackingNote(savedOrder.getStatus()));
        if (savedOrder.getStatus() == OrderStatus.PAID) {
            taxService.recordTaxForPaidOrder(savedOrder);
        }
        return savedOrder;
    }

    private void reduceInventoryIfLinked(Product product, Integer quantity, String orderNumber) {
        if (product.getInventoryItem() == null) return;
        inventoryService.adjustStock(
                product.getInventoryItem().getId(),
                -quantity,
                "Sale completed",
                "SALE",
                orderNumber);
    }

    private void restoreInventoryForOrder(Order order) {
        if (order.getOrderItems() == null) return;
        for (OrderItem item : order.getOrderItems()) {
            Product product = item.getProduct();
            if (product == null || product.getInventoryItem() == null) continue;
            try {
                inventoryService.adjustStock(
                        product.getInventoryItem().getId(),
                        item.getQuantity(),
                        "Order " + order.getOrderNumber() + " cancelled/returned — stock restored",
                        "RETURN",
                        order.getOrderNumber());
            } catch (Exception e) {
                // Log but don't fail the cancellation if restore encounters an issue
            }
        }
    }

    @Transactional
    public Order createOrder(Order order) {
        if (order.getOrderNumber() == null) {
            order.setOrderNumber("LUZ-TEMP-" + UUID.randomUUID().toString().substring(0, 8));
        }
        order.setStatus(OrderStatus.CREATED);
        Order savedOrder = orderRepository.save(order);
        recordTrackingEvent(savedOrder, savedOrder.getStatus(), buildTrackingNote(savedOrder.getStatus()));
        return savedOrder;
    }

    @Transactional
    public Order updateOrderStatus(UUID id, OrderStatus newStatus) {
        Order order = getOrderById(id);
        OrderStatus oldStatus = order.getStatus();
        order.setStatus(newStatus);
        Order savedOrder = orderRepository.save(order);
        if (oldStatus != newStatus) {
            recordTrackingEvent(savedOrder, newStatus, buildTrackingNote(newStatus));
        }

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
            sendReceiptEmail(savedOrder);
        }

        // Restore stock when admin manually moves an order to a terminal cancelled/returned state
        // Only restore once — guard against double-restore if already in one of these states
        boolean wasAlreadyTerminal = oldStatus == OrderStatus.CANCELLED
                || oldStatus == OrderStatus.RETURNED
                || oldStatus == OrderStatus.REFUNDED;
        boolean isNowTerminal = newStatus == OrderStatus.CANCELLED
                || newStatus == OrderStatus.RETURNED
                || newStatus == OrderStatus.REFUNDED;
        if (isNowTerminal && !wasAlreadyTerminal) {
            restoreInventoryForOrder(savedOrder);
        }

        // Auto-create a ReturnRequest when an order is directly set to REFUNDED
        // (covers admin manually refunding without going through the return workflow)
        if (newStatus == OrderStatus.REFUNDED) {
            boolean alreadyExists = returnRequestRepository.findByOrderId(savedOrder.getId()).isPresent();
            if (!alreadyExists) {
                ReturnRequest autoReturn = ReturnRequest.builder()
                        .order(savedOrder)
                        .reason("Refunded by admin")
                        .status("COMPLETED")
                        .requestedAmount(savedOrder.getTotalAmount())
                        .refundedAmount(savedOrder.getTotalAmount())
                        .completedAt(LocalDateTime.now())
                        .build();
                returnRequestRepository.save(autoReturn);
            }
        }

        return savedOrder;
    }

    private void sendReceiptEmail(Order order) {
        order = orderRepository.findByIdWithItemsAndCustomer(order.getId()).orElse(order);
        if (order.getCustomer() == null || order.getCustomer().getEmail() == null) {
            logger.warn("sendReceiptEmail skipped for order {} — customer or email is null", order.getOrderNumber());
            return;
        }
        logger.info("sendReceiptEmail starting for order {} to {}", order.getOrderNumber(), order.getCustomer().getEmail());
        try {
            BigDecimal sub      = order.getSubTotalAmount()  != null ? order.getSubTotalAmount()  : BigDecimal.ZERO;
            BigDecimal discount = order.getDiscountAmount()  != null ? order.getDiscountAmount()  : BigDecimal.ZERO;
            BigDecimal tax      = order.getTaxAmount()       != null ? order.getTaxAmount()       : BigDecimal.ZERO;
            BigDecimal total    = order.getTotalAmount()     != null ? order.getTotalAmount()     : BigDecimal.ZERO;
            BigDecimal rate     = order.getTaxRate()         != null ? order.getTaxRate().multiply(BigDecimal.valueOf(100)) : BigDecimal.valueOf(18);

            BigDecimal taxRate = order.getTaxRate() != null ? order.getTaxRate() : BigDecimal.valueOf(0.18);
            List<Map<String, Object>> itemList = order.getOrderItems().stream().map(i -> {
                Map<String, Object> m = new HashMap<>();
                m.put("productName", i.getProduct() != null ? i.getProduct().getName() : "Product");
                m.put("quantity",    i.getQuantity());
                m.put("unitPrice",   i.getUnitPrice() != null ? i.getUnitPrice().longValue() : 0L);
                BigDecimal lineTotal = i.getUnitPrice() != null
                        ? i.getUnitPrice().multiply(BigDecimal.valueOf(i.getQuantity()))
                        : BigDecimal.ZERO;
                BigDecimal itemTotal = lineTotal.multiply(BigDecimal.ONE.add(taxRate)).setScale(0, java.math.RoundingMode.HALF_UP);
                BigDecimal unitWithTax = i.getUnitPrice() != null
                        ? i.getUnitPrice().multiply(BigDecimal.ONE.add(taxRate)).setScale(0, java.math.RoundingMode.HALF_UP)
                        : BigDecimal.ZERO;
                m.put("subTotal",    lineTotal.longValue());
                m.put("itemTotal",   itemTotal.longValue());
                m.put("unitWithTax", unitWithTax.longValue());
                return m;
            }).collect(Collectors.toList());

            User customer = order.getCustomer();
            String firstName = customer.getFirstName() != null ? customer.getFirstName() : "";
            String lastName  = customer.getLastName()  != null ? customer.getLastName()  : "";
            String fullName  = (firstName + " " + lastName).trim();
            String displayName = fullName.isEmpty() ? customer.getEmail() : fullName;

            Map<String, Object> vars = new HashMap<>();
            vars.put("customerName",    displayName);
            vars.put("orderNumber",     order.getOrderNumber());
            vars.put("items",           itemList);
            vars.put("subTotalAmount",  sub.longValue());
            vars.put("discountAmount",  discount.longValue());
            vars.put("couponCode",      order.getCouponCode());
            vars.put("taxAmount",       tax.longValue());
            vars.put("taxRate",         rate.intValue());
            vars.put("totalAmount",     total.longValue());
            vars.put("paymentMethod",   order.getPaymentMethod() != null ? order.getPaymentMethod() : "—");
            vars.put("paymentReference",order.getPaymentReference());
            vars.put("shippingAddress", order.getShippingAddress());
            vars.put("orderDate",       order.getCreatedAt() != null
                    ? order.getCreatedAt().format(DateTimeFormatter.ofPattern("d MMM yyyy, HH:mm")) : "—");

            mailService.sendEmail(
                    order.getCustomer().getEmail(),
                    "Your Luz Technology Receipt — " + order.getOrderNumber(),
                    "order-confirmation",
                    vars
            );
        } catch (Exception e) {
            logger.error("sendReceiptEmail failed for order {}: {}", order.getOrderNumber(), e.getMessage(), e);
        }
    }

    @Transactional
    public Order updatePaymentDetails(UUID id, String paymentMethod, String paymentReference) {
        Order order = getOrderById(id);
        order.setPaymentMethod(paymentMethod);
        order.setPaymentReference(paymentReference);
        return orderRepository.save(order);
    }

    @Transactional
    public Order cancelOrder(UUID id) {
        Order order = getOrderById(id);
        if (order.getStatus() == OrderStatus.SHIPPED || order.getStatus() == OrderStatus.DELIVERED) {
            throw new IllegalStateException("Cannot cancel an order that has already been shipped or delivered.");
        }
        OrderStatus previousStatus = order.getStatus();
        order.setStatus(OrderStatus.CANCELLED);
        Order savedOrder = orderRepository.save(order);
        recordTrackingEvent(savedOrder, OrderStatus.CANCELLED, buildTrackingNote(OrderStatus.CANCELLED));
        // Restore stock only if it was previously reduced (i.e. order was not already cancelled/refunded)
        if (previousStatus != OrderStatus.CANCELLED && previousStatus != OrderStatus.REFUNDED) {
            restoreInventoryForOrder(savedOrder);
        }
        return savedOrder;
    }

    @Transactional(readOnly = true)
    public OrderTrackingResponse getOrderTracking(UUID id) {
        Order order = getOrderById(id);
        Shipment shipment = shipmentRepository.findByOrderId(order.getId()).orElse(null);
        List<OrderTrackingEventResponse> timeline = trackingEventRepository.findByOrderIdOrderByCreatedAtAsc(order.getId())
                .stream()
                .map(event -> OrderTrackingEventResponse.builder()
                        .status(event.getStatus())
                        .note(event.getNote())
                        .occurredAt(event.getCreatedAt())
                        .build())
                .toList();

        return OrderTrackingResponse.builder()
                .orderId(order.getId())
                .orderNumber(order.getOrderNumber())
                .currentStatus(order.getStatus())
                .trackingNumber(shipment == null ? null : shipment.getTrackingNumber())
                .carrier(shipment == null ? null : shipment.getCarrier())
                .shipmentStatus(shipment == null ? null : shipment.getStatus())
                .estimatedDeliveryDate(shipment == null ? null : shipment.getEstimatedDeliveryDate())
                .actualDeliveryDate(shipment == null ? null : shipment.getActualDeliveryDate())
                .timeline(timeline)
                .build();
    }

    private void recordTrackingEvent(Order order, OrderStatus status, String note) {
        trackingEventRepository.save(OrderTrackingEvent.builder()
                .order(order)
                .status(status)
                .note(note)
                .build());
    }

    private String buildTrackingNote(OrderStatus status) {
        return switch (status) {
            case PENDING -> "Order received and awaiting payment";
            case CREATED -> "Order created";
            case PAID -> "Payment confirmed";
            case PROCESSING -> "Order is being prepared";
            case SHIPPED -> "Order has shipped";
            case DELIVERED -> "Order delivered";
            case CANCELLED -> "Order cancelled";
            case RETURN_REQUESTED -> "Return requested";
            case RETURNED -> "Order returned";
            case REFUNDED -> "Refund completed";
        };
    }
}
