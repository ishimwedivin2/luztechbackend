package com.luztechnology.finance.dto;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
@Builder
public class TaxSummaryResponse {
    private LocalDate startDate;
    private LocalDate endDate;
    private BigDecimal taxableSales;
    private BigDecimal taxCollected;
    private long totalRecords;
    private String status;
}
