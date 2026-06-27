package com.luztechnology.support.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@Builder
public class TicketDetailResponse {
    private UUID id;
    private String title;
    private String description;
    private String status;
    private String priority;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private UUID customerId;
    private String customerFirstName;
    private String customerEmail;
    private UUID agentId;
    private String agentFirstName;
    private String agentEmail;
    private boolean surveyed;
}
