package com.luztechnology.inventory.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class ReceiveProcurementRequest {
    @NotNull
    @Min(1)
    private Integer quantityReceived;
}
