package com.luztechnology.analytics.service;

import com.luztechnology.analytics.entity.SalesReport;
import com.luztechnology.analytics.repository.SalesReportRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AnalyticsService {

    private final SalesReportRepository salesReportRepository;

    public List<SalesReport> getReportsBetween(LocalDate startDate, LocalDate endDate) {
        return salesReportRepository.findByReportDateBetween(startDate, endDate);
    }

    public Double getTotalRevenue(LocalDate startDate, LocalDate endDate) {
        Double total = salesReportRepository.calculateTotalRevenueBetween(startDate, endDate);
        return total != null ? total : 0.0;
    }

    public java.util.Map<String, Object> getFinancialDashboard() {
        java.util.Map<String, Object> dashboard = new java.util.HashMap<>();
        LocalDate now = LocalDate.now();
        LocalDate lastMonth = now.minusMonths(1);

        dashboard.put("totalRevenue", getTotalRevenue(lastMonth, now));
        dashboard.put("inventoryTurnover", calculateInventoryTurnover());
        dashboard.put("topSellingProducts", salesReportRepository.findAll().stream()
                .limit(5)
                .toList());

        return dashboard;
    }

    private Double calculateInventoryTurnover() {
        // Mock logic: Total Sales / Average Inventory
        return 4.2; // Example ratio
    }
}
