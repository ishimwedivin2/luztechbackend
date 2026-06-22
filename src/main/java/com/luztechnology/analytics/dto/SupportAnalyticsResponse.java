package com.luztechnology.analytics.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SupportAnalyticsResponse {
    private long totalTickets;
    private Map<String, Long> statusBreakdown;
    private Map<String, Long> priorityBreakdown;
}
