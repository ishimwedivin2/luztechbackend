package com.luztechnology.inventory.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.inventory.dto.ProcurementOrderRequest;
import com.luztechnology.inventory.dto.ReceiveProcurementRequest;
import com.luztechnology.inventory.entity.ProcurementOrder;
import com.luztechnology.inventory.service.ProcurementService;
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
@RequestMapping("/api/inventory/procurements")
@RequiredArgsConstructor
@PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
public class ProcurementController {

    private final ProcurementService procurementService;

    @GetMapping
    public ResponseEntity<ApiResponse<List<ProcurementOrder>>> getOrders(
            @RequestParam(required = false) String status) {
        List<ProcurementOrder> orders = status == null
                ? procurementService.getAllOrders()
                : procurementService.getOrdersByStatus(status.toUpperCase());
        return ResponseEntity.ok(ApiResponse.success(orders));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<ProcurementOrder>> getOrder(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success(procurementService.getOrderById(id)));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<ProcurementOrder>> createOrder(
            @Valid @RequestBody ProcurementOrderRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Procurement order created", procurementService.createOrder(request)));
    }

    @PatchMapping("/{id}/status")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<ProcurementOrder>> updateStatus(
            @PathVariable UUID id,
            @RequestParam String status) {
        return ResponseEntity.ok(ApiResponse.success("Procurement status updated", procurementService.updateOrderStatus(id, status)));
    }

    @PostMapping("/{id}/receive")
    public ResponseEntity<ApiResponse<ProcurementOrder>> receiveOrder(
            @PathVariable UUID id,
            @Valid @RequestBody ReceiveProcurementRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Procurement received", procurementService.receiveOrder(id, request.getQuantityReceived())));
    }

    @PostMapping("/{id}/cancel")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<ProcurementOrder>> cancelOrder(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Procurement cancelled", procurementService.cancelOrder(id)));
    }
}
