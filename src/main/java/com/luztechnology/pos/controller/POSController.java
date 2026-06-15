package com.luztechnology.pos.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.pos.dto.POSCheckoutRequest;
import com.luztechnology.pos.dto.POSReceiptResponse;
import com.luztechnology.pos.service.POSService;
import com.luztechnology.security.services.UserDetailsImpl;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping("/api/pos")
@RequiredArgsConstructor
@PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
public class POSController {

    private final POSService posService;

    @PostMapping("/checkout")
    public ResponseEntity<ApiResponse<POSReceiptResponse>> checkout(
            @AuthenticationPrincipal UserDetailsImpl cashierDetails,
            @Valid @RequestBody POSCheckoutRequest request) {
        POSReceiptResponse receipt = posService.checkout(cashierDetails, request);
        return ResponseEntity.ok(ApiResponse.success("POS sale completed", receipt));
    }

    @GetMapping("/receipts/{orderId}")
    public ResponseEntity<ApiResponse<POSReceiptResponse>> getReceipt(@PathVariable UUID orderId) {
        return ResponseEntity.ok(ApiResponse.success(posService.getReceipt(orderId)));
    }
}
