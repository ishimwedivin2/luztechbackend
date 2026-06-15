package com.luztechnology.inventory.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.UUID;

@Data
public class ProcurementOrderRequest {
    @NotNull
    private UUID supplierId;

    @NotNull
    private UUID inventoryItemId;

    @NotNull
    @Min(1)
    private Integer quantityOrdered;

    private BigDecimal totalCost;
    private LocalDate expectedDeliveryDate;
}
