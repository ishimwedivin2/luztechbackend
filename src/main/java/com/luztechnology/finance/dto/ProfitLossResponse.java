package com.luztechnology.finance.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@Builder
public class ProfitLossResponse {
    private LocalDate startDate;
    private LocalDate endDate;
    private BigDecimal salesRevenue;
    private BigDecimal refunds;
    private BigDecimal netSales;
    private BigDecimal taxCollected;
    private BigDecimal operatingExpenses;
    private BigDecimal grossProfit;
    private BigDecimal netProfit;
    private BigDecimal profitMarginPercent;
}
