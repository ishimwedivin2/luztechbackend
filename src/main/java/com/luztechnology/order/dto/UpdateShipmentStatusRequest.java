package com.luztechnology.order.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class UpdateShipmentStatusRequest {
    @NotBlank
    private String status;

    private LocalDateTime actualDeliveryDate;
}
