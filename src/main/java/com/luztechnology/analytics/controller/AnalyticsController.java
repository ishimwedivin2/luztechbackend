package com.luztechnology.analytics.controller;

import com.luztechnology.analytics.dto.CustomerAnalyticsResponse;
import com.luztechnology.analytics.dto.InventoryAnalyticsResponse;
import com.luztechnology.analytics.dto.KpiDashboardResponse;
import com.luztechnology.analytics.dto.MonthlyRevenueResponse;
import com.luztechnology.analytics.dto.SupportAnalyticsResponse;
import com.luztechnology.analytics.dto.TopProductResponse;
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
import java.util.Map;

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
    public ResponseEntity<ApiResponse<KpiDashboardResponse>> getDashboard() {
        return ResponseEntity.ok(ApiResponse.success("Dashboard retrieved", analyticsService.getFinancialDashboard()));
    }

    @GetMapping("/dashboard/kpis")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<KpiDashboardResponse>> getKpiDashboard(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        return ResponseEntity.ok(ApiResponse.success("KPI dashboard retrieved",
                analyticsService.getKpiDashboard(startDate, endDate)));
    }

    @GetMapping("/top-products")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<TopProductResponse>>> getTopProducts(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        return ResponseEntity.ok(ApiResponse.success("Top products retrieved",
                analyticsService.getKpiDashboard(startDate, endDate).getTopSellingProducts()));
    }

    @GetMapping("/revenue/monthly")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<MonthlyRevenueResponse>>> getMonthlyRevenue(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        return ResponseEntity.ok(ApiResponse.success("Monthly revenue retrieved",
                analyticsService.getMonthlyRevenue(startDate, endDate)));
    }

    @GetMapping("/orders/by-status")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Map<String, Long>>> getOrdersByStatus(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate) {
        return ResponseEntity.ok(ApiResponse.success("Orders by status retrieved",
                analyticsService.getKpiDashboard(startDate, endDate).getOrderStatusBreakdown()));
    }

    @GetMapping("/customers")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<CustomerAnalyticsResponse>> getCustomerAnalytics() {
        return ResponseEntity.ok(ApiResponse.success("Customer analytics retrieved",
                analyticsService.getCustomerAnalytics()));
    }

    @GetMapping("/inventory")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<InventoryAnalyticsResponse>> getInventoryAnalytics() {
        return ResponseEntity.ok(ApiResponse.success("Inventory analytics retrieved",
                analyticsService.getInventoryAnalytics()));
    }

    @GetMapping("/support")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<SupportAnalyticsResponse>> getSupportAnalytics() {
        return ResponseEntity.ok(ApiResponse.success("Support analytics retrieved",
                analyticsService.getSupportAnalytics()));
    }
}
