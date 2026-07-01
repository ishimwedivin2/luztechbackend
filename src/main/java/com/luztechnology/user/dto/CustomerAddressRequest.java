package com.luztechnology.user.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class CustomerAddressRequest {
    private String label;

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

    private String deliveryInstructions;
    private String deliveryPhoneNumber;
    private boolean defaultAddress;
}
