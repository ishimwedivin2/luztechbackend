package com.luztechnology.order.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
public class CreateShipmentRequest {
    @NotNull
    private UUID orderId;

    private String trackingNumber;

    @NotBlank
    private String carrier;

    private LocalDateTime estimatedDeliveryDate;
}
