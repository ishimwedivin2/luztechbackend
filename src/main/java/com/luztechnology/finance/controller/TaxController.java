package com.luztechnology.finance.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.finance.dto.TaxSummaryResponse;
import com.luztechnology.finance.entity.TaxRecord;
import com.luztechnology.finance.service.TaxService;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/finance/taxes")
@RequiredArgsConstructor
@PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
public class TaxController {

    private final TaxService taxService;
    private final OrderService orderService;

    @GetMapping
    public ResponseEntity<ApiResponse<List<TaxRecord>>> getTaxRecords(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        return ResponseEntity.ok(ApiResponse.success(taxService.getTaxRecords(startDate, endDate)));
    }

    @GetMapping("/summary")
    public ResponseEntity<ApiResponse<TaxSummaryResponse>> getTaxSummary(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        return ResponseEntity.ok(ApiResponse.success(taxService.getTaxSummary(startDate, endDate)));
    }

    @GetMapping("/export")
    public ResponseEntity<byte[]> exportTaxRecords(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        byte[] report = taxService.exportTaxRecordsCsv(startDate, endDate);
        String filename = "tax-records-" + startDate + "-to-" + endDate + ".csv";
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + filename)
                .contentType(MediaType.parseMediaType("text/csv"))
                .body(report);
    }

    @PostMapping("/orders/{orderId}/record")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<TaxRecord>> recordOrderTax(@PathVariable UUID orderId) {
        Order order = orderService.getOrderById(orderId);
        TaxRecord taxRecord = taxService.recordTaxForPaidOrder(order);
        return ResponseEntity.ok(ApiResponse.success("Tax record generated", taxRecord));
    }
}
