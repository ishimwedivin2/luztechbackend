package com.luztechnology.analytics.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class InventoryAnalyticsResponse {
    private int totalItems;
    private int totalUnits;
    private int lowStockItems;
    private int outOfStockItems;
    private BigDecimal stockHealthPercent;
    private List<LowStockItemResponse> lowStock;
}
