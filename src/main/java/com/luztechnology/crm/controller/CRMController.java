package com.luztechnology.crm.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.crm.service.CRMService;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
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
@PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
public class CRMController {

    private final CRMService crmService;
    private final UserRepository userRepository;

    @GetMapping("/customers")
    public ResponseEntity<ApiResponse<List<User>>> getAllCustomers() {
        return ResponseEntity.ok(ApiResponse.success(userRepository.findAll()));
    }

    @GetMapping("/customers/{id}/summary")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getCustomerSummary(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success(crmService.getCustomerSummary(id)));
    }
}
