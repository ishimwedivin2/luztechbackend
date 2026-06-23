package com.luztechnology.admin.controller;

import com.luztechnology.admin.entity.AuditLog;
import com.luztechnology.admin.service.AuditService;
import com.luztechnology.auth.entity.LoginAttempt;
import com.luztechnology.auth.repository.LoginAttemptRepository;
import com.luztechnology.common.dto.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/admin/audit")
@RequiredArgsConstructor
@PreAuthorize("hasRole('ADMIN')")
public class AuditController {

    private final AuditService auditService;
    private final LoginAttemptRepository loginAttemptRepository;

    @GetMapping
    public ResponseEntity<ApiResponse<Page<AuditLog>>> getAllLogs(Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.success(auditService.getAllLogs(pageable)));
    }

    @GetMapping("/search")
    public ResponseEntity<ApiResponse<Page<AuditLog>>> searchLogs(
            @RequestParam String email,
            Pageable pageable) {
        return ResponseEntity.ok(ApiResponse.success(auditService.getLogsByEmail(email, pageable)));
    }

    @GetMapping("/login-attempts")
    public ResponseEntity<ApiResponse<Page<LoginAttempt>>> getLoginAttempts(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "100") int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        return ResponseEntity.ok(ApiResponse.success(loginAttemptRepository.findAll(pageable)));
    }
}
