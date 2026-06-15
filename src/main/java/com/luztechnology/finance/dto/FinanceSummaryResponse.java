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
    private BigDecimal expenses;
    private BigDecimal taxCollected;
    private BigDecimal grossProfit;
    private BigDecimal netProfit;
    private long paidOrders;
    private long expenseRecords;
}
