package com.luztechnology.admin.controller;

import com.luztechnology.admin.dto.SystemConfigurationRequest;
import com.luztechnology.admin.entity.SystemConfiguration;
import com.luztechnology.admin.service.SystemConfigurationService;
import com.luztechnology.common.dto.ApiResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/admin/configurations")
@RequiredArgsConstructor
@PreAuthorize("hasRole('ADMIN')")
public class SystemConfigurationController {

    private final SystemConfigurationService systemConfigurationService;

    @GetMapping
    public ResponseEntity<ApiResponse<List<SystemConfiguration>>> getConfigurations() {
        return ResponseEntity.ok(ApiResponse.success("Configurations retrieved",
                systemConfigurationService.getConfigurations()));
    }

    @GetMapping("/{key}")
    public ResponseEntity<ApiResponse<SystemConfiguration>> getConfiguration(@PathVariable String key) {
        return ResponseEntity.ok(ApiResponse.success("Configuration retrieved",
                systemConfigurationService.getConfiguration(key)));
    }

    @PutMapping("/{key}")
    public ResponseEntity<ApiResponse<SystemConfiguration>> upsertConfiguration(
            @PathVariable String key,
            @Valid @RequestBody SystemConfigurationRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Configuration saved",
                systemConfigurationService.upsertConfiguration(key, request)));
    }

    @DeleteMapping("/{key}")
    public ResponseEntity<ApiResponse<Object>> deleteConfiguration(@PathVariable String key) {
        systemConfigurationService.deleteConfiguration(key);
        return ResponseEntity.ok(ApiResponse.success("Configuration deleted", null));
    }
}
