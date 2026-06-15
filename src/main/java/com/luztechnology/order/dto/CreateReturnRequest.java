package com.luztechnology.order.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.UUID;

@Data
public class CreateReturnRequest {
    @NotNull
    private UUID orderId;

    @NotBlank
    private String reason;
}
