package com.luztechnology.crm.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.UUID;

@Data
public class CommunicationLogRequest {

    @NotNull
    private UUID customerId;

    private UUID handledById;

    @NotBlank
    private String channel;

    @NotBlank
    private String subject;

    private String notes;

    private String outcome;

    private String referenceType;

    private String referenceId;
}
