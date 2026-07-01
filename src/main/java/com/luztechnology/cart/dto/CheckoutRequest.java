package com.luztechnology.cart.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

import java.util.UUID;

@Data
public class CheckoutRequest {
    private String shippingAddress;

    private UUID shippingAddressId;

    private ShippingAddressDTO shippingAddressDetails;

    private boolean saveShippingAddress;

    private String deliveryInstructions;

    private String deliveryPhoneNumber;

    private String billingAddress;

    @NotBlank
    private String paymentMethod;

    private String couponCode;        // optional discount code

    @Data
    public static class ShippingAddressDTO {
        @NotBlank
        private String province;

        @NotBlank
        private String district;

        @NotBlank
        private String sector;

        @NotBlank
        private String cell;

        @NotBlank
        private String village;

        private String label;
        private String deliveryInstructions;
        private String deliveryPhoneNumber;
        private boolean defaultAddress;
    }
}
