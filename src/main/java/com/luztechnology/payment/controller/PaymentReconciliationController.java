package com.luztechnology.payment.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.payment.entity.PaymentTransaction;
import com.luztechnology.payment.service.PaymentReconciliationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api/payments/reconciliation")
@RequiredArgsConstructor
@PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
public class PaymentReconciliationController {

    private final PaymentReconciliationService reconciliationService;

    @GetMapping("/transactions")
    public ResponseEntity<ApiResponse<List<PaymentTransaction>>> getTransactions(
            @RequestParam(required = false) UUID orderId) {
        return ResponseEntity.ok(ApiResponse.success("Payment transactions retrieved",
                reconciliationService.getTransactions(orderId)));
    }

    @GetMapping("/summary")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getSummary() {
        return ResponseEntity.ok(ApiResponse.success("Payment reconciliation summary retrieved",
                reconciliationService.getSummary()));
    }

    @PatchMapping("/transactions/{id}")
    public ResponseEntity<ApiResponse<PaymentTransaction>> reconcileTransaction(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Payment transaction reconciled",
                reconciliationService.reconcileTransaction(id)));
    }

    @PatchMapping("/run")
    public ResponseEntity<ApiResponse<Map<String, Object>>> reconcileAll() {
        return ResponseEntity.ok(ApiResponse.success("Payment reconciliation completed",
                reconciliationService.reconcileAll()));
    }
}
