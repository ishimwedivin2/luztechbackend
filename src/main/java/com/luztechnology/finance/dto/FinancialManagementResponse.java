package com.luztechnology.finance.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@Builder
public class FinancialManagementResponse {
    private LocalDate startDate;
    private LocalDate endDate;
    private BigDecimal grossRevenue;
    private BigDecimal refunds;
    private BigDecimal netRevenue;
    private BigDecimal taxCollected;
    private BigDecimal taxableRevenue;
    /** Cost of Goods Sold — sum of OrderItem.lineCost for all revenue orders. */
    private BigDecimal cogs;
    private BigDecimal operatingExpenses;
    private BigDecimal paidExpenses;
    private BigDecimal pendingExpenses;
    /** Gross Profit = Net Revenue − COGS. */
    private BigDecimal grossProfit;
    /** Net Profit = Gross Profit − Operating Expenses. */
    private BigDecimal netProfit;
    private BigDecimal accountsReceivable;
    private BigDecimal taxLiability;
    private BigDecimal estimatedCashPosition;
    private long revenueOrders;
    private long refundedReturns;
    private long expenseRecords;
    private long pendingExpenseRecords;
    private long receivableOrders;
}
