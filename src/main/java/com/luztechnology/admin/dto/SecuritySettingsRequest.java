package com.luztechnology.admin.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.Data;

@Data
public class SecuritySettingsRequest {
    private boolean mfaRequired;

    @Min(6)
    @Max(128)
    private int passwordMinLength;

    private boolean passwordRequireUppercase;
    private boolean passwordRequireLowercase;
    private boolean passwordRequireDigit;
    private boolean passwordRequireSpecialCharacter;

    @Min(1)
    @Max(20)
    private int maxFailedLoginAttempts;

    @Min(1)
    @Max(1440)
    private int lockoutDurationMinutes;

    @Min(5)
    @Max(43200)
    private int sessionTimeoutMinutes;
}
