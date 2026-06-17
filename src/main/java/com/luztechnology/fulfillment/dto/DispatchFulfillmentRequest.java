package com.luztechnology.fulfillment.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class DispatchFulfillmentRequest {
    private String trackingNumber;

    @NotBlank(message = "Carrier is required")
    private String carrier;

    private LocalDateTime estimatedDeliveryDate;
}
