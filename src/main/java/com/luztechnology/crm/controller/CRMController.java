package com.luztechnology.crm.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.crm.dto.CommunicationLogRequest;
import com.luztechnology.crm.entity.CommunicationLog;
import com.luztechnology.crm.service.CRMService;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api/crm")
@RequiredArgsConstructor
public class CRMController {

    private final CRMService crmService;
    private final UserRepository userRepository;

    @GetMapping("/customers")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<List<User>>> getAllCustomers() {
        return ResponseEntity.ok(ApiResponse.success(userRepository.findByRoles_Name("ROLE_CUSTOMER")));
    }

    @GetMapping("/customers/{id}/summary")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getCustomerSummary(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success(crmService.getCustomerSummary(id)));
    }

    @GetMapping("/analytics")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getCrmAnalytics() {
        return ResponseEntity.ok(ApiResponse.success("CRM analytics retrieved", crmService.getCrmAnalytics()));
    }

    @GetMapping("/customers/{id}/analytics")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getCustomerAnalytics(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Customer analytics retrieved", crmService.getCustomerAnalytics(id)));
    }

    @GetMapping("/customers/{id}/communications")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<List<CommunicationLog>>> getCommunicationLogs(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Communication logs retrieved", crmService.getCommunicationLogs(id)));
    }

    @PostMapping("/communications")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<CommunicationLog>> createCommunicationLog(
            @Valid @RequestBody CommunicationLogRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Communication log created",
                crmService.createCommunicationLog(request)));
    }
}
