package com.luztechnology.analytics.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class KpiDashboardResponse {
    private LocalDate startDate;
    private LocalDate endDate;
    private BigDecimal totalRevenue;
    private int totalOrders;
    private int paidOrActiveOrders;
    private BigDecimal averageOrderValue;
    private long activeCustomers;
    private BigDecimal refundRate;
    private Map<String, Long> orderStatusBreakdown;
    private List<SalesTrendPoint> salesTrend;
    private List<TopProductResponse> topSellingProducts;
    private CustomerAnalyticsResponse customerAnalytics;
    private InventoryAnalyticsResponse inventoryAnalytics;
    private SupportAnalyticsResponse supportAnalytics;
}
