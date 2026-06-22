package com.luztechnology.pos.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.pos.dto.POSCheckoutRequest;
import com.luztechnology.pos.dto.POSHistoryResponse;
import com.luztechnology.pos.dto.POSReceiptResponse;
import com.luztechnology.pos.dto.POSSummaryResponse;
import com.luztechnology.pos.service.POSService;
import com.luztechnology.security.services.UserDetailsImpl;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
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

    @GetMapping("/history")
    public ResponseEntity<ApiResponse<Page<POSHistoryResponse>>> getHistory(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {
        return ResponseEntity.ok(ApiResponse.success("POS history retrieved",
                posService.getHistory(page, size)));
    }

    @GetMapping("/summary")
    public ResponseEntity<ApiResponse<POSSummaryResponse>> getSummary(
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        LocalDate end   = endDate   != null ? endDate   : LocalDate.now();
        LocalDate start = startDate != null ? startDate : end.minusDays(30);
        return ResponseEntity.ok(ApiResponse.success("POS summary retrieved",
                posService.getSummary(start, end)));
    }
}
