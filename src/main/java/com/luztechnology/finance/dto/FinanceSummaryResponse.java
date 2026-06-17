package com.luztechnology.finance.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@Builder
public class FinanceSummaryResponse {
    private LocalDate startDate;
    private LocalDate endDate;
    private BigDecimal revenue;
    private BigDecimal refunds;
    private BigDecimal netRevenue;
    private BigDecimal expenses;
    private BigDecimal taxCollected;
    private BigDecimal grossProfit;
    private BigDecimal netProfit;
    private BigDecimal accountsReceivable;
    private long paidOrders;
    private long refundedReturns;
    private long expenseRecords;
}
