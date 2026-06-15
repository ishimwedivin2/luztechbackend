package com.luztechnology.pos.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.util.List;
import java.util.UUID;

@Data
public class POSCheckoutRequest {
    private UUID customerId;

    @NotBlank
    private String paymentMethod;

    private String paymentReference;

    @Valid
    @NotEmpty
    private List<POSItemRequest> items;
}
