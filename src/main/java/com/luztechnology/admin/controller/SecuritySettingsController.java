package com.luztechnology.admin.controller;

import com.luztechnology.admin.dto.SecuritySettingsRequest;
import com.luztechnology.admin.entity.SecuritySettings;
import com.luztechnology.admin.service.SecuritySettingsService;
import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/admin/security-settings")
@RequiredArgsConstructor
@PreAuthorize("hasRole('ADMIN')")
public class SecuritySettingsController {

    private final SecuritySettingsService securitySettingsService;
    private final UserRepository userRepository;

    @GetMapping
    public ResponseEntity<ApiResponse<SecuritySettings>> getSettings() {
        return ResponseEntity.ok(ApiResponse.success("Security settings retrieved",
                securitySettingsService.getSettings()));
    }

    @PutMapping
    public ResponseEntity<ApiResponse<SecuritySettings>> updateSettings(
            @Valid @RequestBody SecuritySettingsRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Security settings updated",
                securitySettingsService.updateSettings(request)));
    }

    @PostMapping("/users/{userId}/unlock")
    public ResponseEntity<ApiResponse<User>> unlockUser(@PathVariable java.util.UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));
        user.setLocked(false);
        return ResponseEntity.ok(ApiResponse.success("User unlocked", userRepository.save(user)));
    }
}
