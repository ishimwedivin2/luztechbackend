package com.luztechnology.analytics.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CustomerAnalyticsResponse {
    private long totalCustomers;
    private long profiledCustomers;
    private BigDecimal lifetimeValue;
    private BigDecimal averageLifetimeValue;
    private Map<String, Long> segmentBreakdown;
    private long customersWithSupportTickets;
}
