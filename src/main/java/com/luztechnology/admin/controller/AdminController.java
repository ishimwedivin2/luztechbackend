package com.luztechnology.admin.controller;

import com.luztechnology.admin.dto.AssignRoleRequest;
import com.luztechnology.admin.dto.CreateBackupRequest;
import com.luztechnology.admin.dto.ReplaceRolesRequest;
import com.luztechnology.admin.entity.SystemBackup;
import com.luztechnology.admin.service.SystemBackupService;
import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.user.entity.Role;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.RoleRepository;
import com.luztechnology.user.repository.UserRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Set;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/admin")
@RequiredArgsConstructor
public class AdminController {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final SystemBackupService systemBackupService;

    @GetMapping("/users")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<List<User>>> getAllUsers() {
        return ResponseEntity.ok(ApiResponse.success("Users retrieved", userRepository.findAll()));
    }

    @GetMapping("/roles")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<List<Role>>> getAllRoles() {
        return ResponseEntity.ok(ApiResponse.success("Roles retrieved", roleRepository.findAll()));
    }

    @PostMapping("/users/{userId}/roles")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<User>> assignRole(
            @PathVariable UUID userId,
            @Valid @RequestBody AssignRoleRequest request) {
        User user = getUser(userId);
        Role role = getRole(request.getRoleName());
        user.getRoles().add(role);
        return ResponseEntity.ok(ApiResponse.success("Role assigned", userRepository.save(user)));
    }

    @PutMapping("/users/{userId}/roles")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<User>> replaceRoles(
            @PathVariable UUID userId,
            @Valid @RequestBody ReplaceRolesRequest request) {
        User user = getUser(userId);
        Set<Role> roles = request.getRoleNames().stream()
                .map(this::getRole)
                .collect(Collectors.toSet());
        user.setRoles(roles);
        return ResponseEntity.ok(ApiResponse.success("User roles updated", userRepository.save(user)));
    }

    @DeleteMapping("/users/{userId}/roles/{roleName}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<User>> removeRole(
            @PathVariable UUID userId,
            @PathVariable String roleName) {
        User user = getUser(userId);
        Role role = getRole(roleName);
        user.getRoles().removeIf(existing -> existing.getId().equals(role.getId()));
        return ResponseEntity.ok(ApiResponse.success("Role removed", userRepository.save(user)));
    }

    @PostMapping("/backup")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<SystemBackup>> triggerBackup(
            @RequestBody(required = false) CreateBackupRequest request) {
        String name = request == null ? null : request.getName();
        return ResponseEntity.ok(ApiResponse.success("Backup completed", systemBackupService.createBackup(name)));
    }

    @GetMapping("/backups")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<List<SystemBackup>>> getBackups() {
        return ResponseEntity.ok(ApiResponse.success("Backups retrieved", systemBackupService.getBackups()));
    }

    @GetMapping("/backups/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<SystemBackup>> getBackup(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Backup retrieved", systemBackupService.getBackup(id)));
    }

    @PostMapping("/backups/{id}/restore")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<SystemBackup>> restoreBackup(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Backup restored", systemBackupService.restoreBackup(id)));
    }

    private User getUser(UUID userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User not found with id: " + userId));
    }

    private Role getRole(String roleName) {
        String normalized = normalizeRoleName(roleName);
        return roleRepository.findByName(normalized)
                .orElseThrow(() -> new ResourceNotFoundException("Role not found: " + normalized));
    }

    private String normalizeRoleName(String roleName) {
        String value = roleName == null ? "" : roleName.trim().toUpperCase();
        return value.startsWith("ROLE_") ? value : "ROLE_" + value;
    }
}
