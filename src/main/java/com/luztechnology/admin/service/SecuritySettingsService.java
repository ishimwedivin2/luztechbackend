package com.luztechnology.admin.service;

import com.luztechnology.admin.dto.SecuritySettingsRequest;
import com.luztechnology.admin.entity.SecuritySettings;
import com.luztechnology.admin.repository.SecuritySettingsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class SecuritySettingsService {

    private final SecuritySettingsRepository securitySettingsRepository;

    @Transactional
    public SecuritySettings getSettings() {
        return securitySettingsRepository.findAll().stream()
                .findFirst()
                .orElseGet(() -> securitySettingsRepository.save(SecuritySettings.builder().build()));
    }

    @Transactional
    public SecuritySettings updateSettings(SecuritySettingsRequest request) {
        SecuritySettings settings = getSettings();
        settings.setMfaRequired(request.isMfaRequired());
        settings.setPasswordMinLength(request.getPasswordMinLength());
        settings.setPasswordRequireUppercase(request.isPasswordRequireUppercase());
        settings.setPasswordRequireLowercase(request.isPasswordRequireLowercase());
        settings.setPasswordRequireDigit(request.isPasswordRequireDigit());
        settings.setPasswordRequireSpecialCharacter(request.isPasswordRequireSpecialCharacter());
        settings.setMaxFailedLoginAttempts(request.getMaxFailedLoginAttempts());
        settings.setLockoutDurationMinutes(request.getLockoutDurationMinutes());
        settings.setSessionTimeoutMinutes(request.getSessionTimeoutMinutes());
        return securitySettingsRepository.save(settings);
    }

    public void validatePassword(String password) {
        SecuritySettings settings = getSettings();
        if (password == null || password.length() < settings.getPasswordMinLength()) {
            throw new IllegalArgumentException("Password must be at least " + settings.getPasswordMinLength() + " characters");
        }
        if (settings.isPasswordRequireUppercase() && password.chars().noneMatch(Character::isUpperCase)) {
            throw new IllegalArgumentException("Password must contain at least one uppercase letter");
        }
        if (settings.isPasswordRequireLowercase() && password.chars().noneMatch(Character::isLowerCase)) {
            throw new IllegalArgumentException("Password must contain at least one lowercase letter");
        }
        if (settings.isPasswordRequireDigit() && password.chars().noneMatch(Character::isDigit)) {
            throw new IllegalArgumentException("Password must contain at least one digit");
        }
        if (settings.isPasswordRequireSpecialCharacter()
                && password.chars().noneMatch(ch -> !Character.isLetterOrDigit(ch))) {
            throw new IllegalArgumentException("Password must contain at least one special character");
        }
    }
}
