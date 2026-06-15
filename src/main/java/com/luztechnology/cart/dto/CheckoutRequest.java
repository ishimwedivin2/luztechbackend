package com.luztechnology.cart.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class CheckoutRequest {
    @NotBlank
    private String shippingAddress;

    private String billingAddress;

    @NotBlank
    private String paymentMethod;
}
