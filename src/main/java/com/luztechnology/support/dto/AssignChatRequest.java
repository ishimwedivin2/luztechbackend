package com.luztechnology.support.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.UUID;

@Data
public class AssignChatRequest {
    @NotNull
    private UUID agentId;
}
