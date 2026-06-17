package com.luztechnology.admin.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "security_settings")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SecuritySettings extends BaseEntity {

    @Builder.Default
    private boolean mfaRequired = true;

    @Builder.Default
    private int passwordMinLength = 6;

    @Builder.Default
    private boolean passwordRequireUppercase = false;

    @Builder.Default
    private boolean passwordRequireLowercase = false;

    @Builder.Default
    private boolean passwordRequireDigit = false;

    @Builder.Default
    private boolean passwordRequireSpecialCharacter = false;

    @Builder.Default
    private int maxFailedLoginAttempts = 5;

    @Builder.Default
    private int lockoutDurationMinutes = 15;

    @Builder.Default
    private int sessionTimeoutMinutes = 1440;
}
