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
    /** Cost of Goods Sold — sum of OrderItem.lineCost for all sold items. */
    private BigDecimal cogs;
    private BigDecimal expenses;
    private BigDecimal taxCollected;
    /** Gross Profit = Net Revenue − COGS. */
    private BigDecimal grossProfit;
    /** Net Profit = Gross Profit − Operating Expenses. */
    private BigDecimal netProfit;
    private BigDecimal accountsReceivable;
    private long paidOrders;
    private long refundedReturns;
    private long expenseRecords;
}
