package com.luztechnology.order.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.order.dto.CreateShipmentRequest;
import com.luztechnology.order.dto.UpdateShipmentStatusRequest;
import com.luztechnology.order.entity.Shipment;
import com.luztechnology.order.service.ShipmentService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/shipments")
@RequiredArgsConstructor
public class ShipmentController {

    private final ShipmentService shipmentService;

    @GetMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<Shipment>>> getShipments(
            @RequestParam(required = false) String status) {
        return ResponseEntity.ok(ApiResponse.success(shipmentService.getShipments(status)));
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<Shipment>> getShipment(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success(shipmentService.getShipmentById(id)));
    }

    @GetMapping("/order/{orderId}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<Shipment>> getShipmentByOrder(@PathVariable UUID orderId) {
        return ResponseEntity.ok(ApiResponse.success(shipmentService.getShipmentByOrderId(orderId)));
    }

    @GetMapping("/track/{trackingNumber}")
    public ResponseEntity<ApiResponse<Shipment>> trackShipment(@PathVariable String trackingNumber) {
        return ResponseEntity.ok(ApiResponse.success(shipmentService.getShipmentByTrackingNumber(trackingNumber)));
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Shipment>> createShipment(
            @Valid @RequestBody CreateShipmentRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Shipment created", shipmentService.createShipment(request)));
    }

    @PatchMapping("/{id}/status")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Shipment>> updateStatus(
            @PathVariable UUID id,
            @Valid @RequestBody UpdateShipmentStatusRequest request) {
        Shipment shipment = shipmentService.updateStatus(id, request.getStatus(), request.getActualDeliveryDate());
        return ResponseEntity.ok(ApiResponse.success("Shipment status updated", shipment));
    }

    @PostMapping("/{id}/cancel")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Shipment>> cancelShipment(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Shipment cancelled", shipmentService.cancelShipment(id)));
    }
}
