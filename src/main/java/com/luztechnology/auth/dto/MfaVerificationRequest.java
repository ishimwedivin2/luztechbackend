package com.luztechnology.auth.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Data
public class MfaVerificationRequest {

    @NotBlank
    private String mfaToken;

    @NotBlank
    @Pattern(regexp = "\\d{6}", message = "MFA code must be 6 digits")
    private String code;
}
