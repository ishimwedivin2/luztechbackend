package com.luztechnology.support.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.UUID;

@Data
public class AssignTicketRequest {
    @NotNull(message = "Agent id is required")
    private UUID agentId;
}
