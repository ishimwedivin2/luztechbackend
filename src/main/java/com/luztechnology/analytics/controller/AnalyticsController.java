package com.luztechnology.analytics.controller;

import com.luztechnology.analytics.entity.SalesReport;
import com.luztechnology.analytics.service.AnalyticsService;
import com.luztechnology.common.dto.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api/analytics")
@RequiredArgsConstructor
public class AnalyticsController {

    private final AnalyticsService analyticsService;

    @GetMapping("/sales")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<SalesReport>>> getSalesReports(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        return ResponseEntity.ok(ApiResponse.success(analyticsService.getReportsBetween(startDate, endDate)));
    }

    @GetMapping("/revenue")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Double>> getTotalRevenue(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        return ResponseEntity.ok(ApiResponse.success(analyticsService.getTotalRevenue(startDate, endDate)));
    }

    @GetMapping("/dashboard")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<java.util.Map<String, Object>>> getDashboard() {
        return ResponseEntity
                .ok(ApiResponse.success("Dashboard retrieved", analyticsService.getFinancialDashboard()));
    }

    @GetMapping("/dashboard/kpis")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<java.util.Map<String, Object>>> getKpiDashboard(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        return ResponseEntity.ok(ApiResponse.success("KPI dashboard retrieved",
                analyticsService.getKpiDashboard(startDate, endDate)));
    }

    @GetMapping("/customers")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<java.util.Map<String, Object>>> getCustomerAnalytics() {
        return ResponseEntity.ok(ApiResponse.success("Customer analytics retrieved",
                analyticsService.getCustomerAnalytics()));
    }

    @GetMapping("/inventory")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<java.util.Map<String, Object>>> getInventoryAnalytics() {
        return ResponseEntity.ok(ApiResponse.success("Inventory analytics retrieved",
                analyticsService.getInventoryAnalytics()));
    }

    @GetMapping("/support")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<java.util.Map<String, Object>>> getSupportAnalytics() {
        return ResponseEntity.ok(ApiResponse.success("Support analytics retrieved",
                analyticsService.getSupportAnalytics()));
    }
}
