package com.luztechnology.order.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.order.dto.CustomerOrderResponse;
import com.luztechnology.order.dto.OrderTrackingResponse;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/orders")
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;

    @GetMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<List<Order>>> getAllOrders(
            @RequestParam(required = false) String customerName,
            @RequestParam(required = false) String productName,
            @RequestParam(required = false) String customerEmail,
            @RequestParam(name = "order", required = false) String orderQuery,
            @RequestParam(required = false) OrderStatus status,
            @RequestParam(required = false) LocalDate date) {
        LocalDateTime startDate = date != null ? date.atStartOfDay() : null;
        LocalDateTime endDate = date != null ? date.plusDays(1).atStartOfDay() : null;
        return ResponseEntity.ok(ApiResponse.success(orderService.searchOrders(
                customerName,
                productName,
                customerEmail,
                orderQuery,
                status,
                startDate,
                endDate)));
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'SUPPORT_AGENT', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<Order>> getOrderById(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success(orderService.getOrderById(id)));
    }

    @GetMapping("/{id}/tracking")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'SUPPORT_AGENT', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<OrderTrackingResponse>> getOrderTracking(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Order tracking retrieved", orderService.getOrderTracking(id)));
    }

    @GetMapping("/customer/{customerId}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'SUPPORT_AGENT', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<List<CustomerOrderResponse>>> getOrdersByCustomer(@PathVariable UUID customerId) {
        return ResponseEntity.ok(ApiResponse.success(orderService.getCustomerOrderDtos(customerId)));
    }

    @PostMapping
    @PreAuthorize("hasRole('CUSTOMER')")
    public ResponseEntity<ApiResponse<Order>> createOrder(
            @RequestBody com.luztechnology.order.dto.OrderRequestDTO orderRequest) {
        return ResponseEntity.ok(ApiResponse.success("Order Created", orderService.processOrder(orderRequest)));
    }

    @PatchMapping("/{id}/status")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Order>> updateOrderStatus(@PathVariable UUID id,
            @RequestParam OrderStatus status) {
        return ResponseEntity
                .ok(ApiResponse.success("Order status updated", orderService.updateOrderStatus(id, status)));
    }

    @PostMapping("/{id}/cancel")
    @PreAuthorize("hasAnyRole('ADMIN', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<Order>> cancelOrder(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Order Cancelled", orderService.cancelOrder(id)));
    }
}
