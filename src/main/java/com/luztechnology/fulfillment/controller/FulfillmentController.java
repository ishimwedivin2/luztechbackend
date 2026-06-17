package com.luztechnology.fulfillment.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.fulfillment.dto.DispatchFulfillmentRequest;
import com.luztechnology.fulfillment.dto.FulfillmentResponse;
import com.luztechnology.fulfillment.service.FulfillmentService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping("/api/fulfillment/orders")
@RequiredArgsConstructor
@PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
public class FulfillmentController {

    private final FulfillmentService fulfillmentService;

    @GetMapping("/{orderId}")
    public ResponseEntity<ApiResponse<FulfillmentResponse>> getFulfillment(@PathVariable UUID orderId) {
        return ResponseEntity.ok(ApiResponse.success("Fulfillment retrieved",
                fulfillmentService.getFulfillment(orderId)));
    }

    @PostMapping("/{orderId}/pick")
    public ResponseEntity<ApiResponse<FulfillmentResponse>> pickOrder(@PathVariable UUID orderId) {
        return ResponseEntity.ok(ApiResponse.success("Order picked",
                fulfillmentService.pickOrder(orderId)));
    }

    @PostMapping("/{orderId}/pack")
    public ResponseEntity<ApiResponse<FulfillmentResponse>> packOrder(@PathVariable UUID orderId) {
        return ResponseEntity.ok(ApiResponse.success("Order packed",
                fulfillmentService.packOrder(orderId)));
    }

    @PostMapping("/{orderId}/dispatch")
    public ResponseEntity<ApiResponse<FulfillmentResponse>> dispatchOrder(
            @PathVariable UUID orderId,
            @Valid @RequestBody DispatchFulfillmentRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Order dispatched",
                fulfillmentService.dispatchOrder(orderId, request)));
    }

    @PostMapping("/{orderId}/complete")
    public ResponseEntity<ApiResponse<FulfillmentResponse>> completeOrder(@PathVariable UUID orderId) {
        return ResponseEntity.ok(ApiResponse.success("Fulfillment completed",
                fulfillmentService.completeOrder(orderId)));
    }
}
