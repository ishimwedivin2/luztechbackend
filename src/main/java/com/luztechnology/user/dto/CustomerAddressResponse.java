package com.luztechnology.user.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@Builder
public class CustomerAddressResponse {
    private UUID id;
    private String label;
    private String province;
    private String district;
    private String sector;
    private String cell;
    private String village;
    private String deliveryInstructions;
    private String deliveryPhoneNumber;
    private boolean defaultAddress;
    private String formattedAddress;
    private LocalDateTime createdAt;
}
