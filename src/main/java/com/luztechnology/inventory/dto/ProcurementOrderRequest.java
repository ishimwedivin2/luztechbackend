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

    /**
     * Optional product link — when provided, unitCost is auto-populated
     * from product.costPrice if unitCost is not explicitly set.
     */
    private UUID productId;

    @NotNull
    @Min(1)
    private Integer quantityOrdered;

    /**
     * Per-unit cost for this procurement order.
     * If null and productId is provided, defaults to product.costPrice.
     * totalCost is computed as: unitCost × quantityOrdered.
     */
    private BigDecimal unitCost;

    private LocalDate expectedDeliveryDate;
}
