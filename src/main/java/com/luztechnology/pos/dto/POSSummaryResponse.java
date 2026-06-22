package com.luztechnology.pos.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class POSSummaryResponse {
    private LocalDate startDate;
    private LocalDate endDate;
    private int totalTransactions;
    private BigDecimal totalRevenue;
    private BigDecimal averageTransactionValue;
    private Map<String, Long> paymentMethodBreakdown;
    private Map<String, BigDecimal> paymentMethodRevenue;
}
