package com.luztechnology.admin.controller;

import com.luztechnology.admin.dto.AssignRoleRequest;
import com.luztechnology.admin.dto.CreateBackupRequest;
import com.luztechnology.admin.dto.CreateUserRequest;
import com.luztechnology.admin.dto.ReplaceRolesRequest;
import com.luztechnology.admin.dto.UpdateUserRequest;
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
import org.springframework.security.crypto.password.PasswordEncoder;
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
    private final PasswordEncoder passwordEncoder;

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

    @GetMapping("/users/{userId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<User>> getUser(@PathVariable UUID userId) {
        return ResponseEntity.ok(ApiResponse.success("User retrieved", getUser_(userId)));
    }

    @PostMapping("/users")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<User>> createUser(@Valid @RequestBody CreateUserRequest request) {
        if (userRepository.existsByEmail(request.getEmail())) {
            throw new IllegalArgumentException("Email already in use: " + request.getEmail());
        }
        String roleName = (request.getRoleName() == null || request.getRoleName().isBlank())
                ? "ROLE_CUSTOMER"
                : normalizeRoleName(request.getRoleName());
        Role role = getRole(roleName);
        User user = User.builder()
                .firstName(request.getFirstName())
                .lastName(request.getLastName())
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .enabled(true)
                .emailVerified(false)
                .roles(Set.of(role))
                .build();
        return ResponseEntity.ok(ApiResponse.success("User created", userRepository.save(user)));
    }

    @PutMapping("/users/{userId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<User>> updateUser(
            @PathVariable UUID userId,
            @RequestBody UpdateUserRequest request) {
        User user = getUser_(userId);
        if (request.getFirstName() != null) user.setFirstName(request.getFirstName());
        if (request.getLastName()  != null) user.setLastName(request.getLastName());
        if (request.getPhoneNumber() != null) user.setPhoneNumber(request.getPhoneNumber());
        if (request.getAddress()   != null) user.setAddress(request.getAddress());
        return ResponseEntity.ok(ApiResponse.success("User updated", userRepository.save(user)));
    }

    @PostMapping("/users/{userId}/block")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<User>> blockUser(@PathVariable UUID userId) {
        User user = getUser_(userId);
        user.setLocked(true);
        user.setEnabled(false);
        return ResponseEntity.ok(ApiResponse.success("User blocked", userRepository.save(user)));
    }

    @PostMapping("/users/{userId}/unblock")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<User>> unblockUser(@PathVariable UUID userId) {
        User user = getUser_(userId);
        user.setLocked(false);
        user.setEnabled(true);
        return ResponseEntity.ok(ApiResponse.success("User unblocked", userRepository.save(user)));
    }

    @PostMapping("/users/{userId}/roles")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<User>> assignRole(
            @PathVariable UUID userId,
            @Valid @RequestBody AssignRoleRequest request) {
        User user = getUser_(userId);
        Role role = getRole(request.getRoleName());
        user.getRoles().add(role);
        return ResponseEntity.ok(ApiResponse.success("Role assigned", userRepository.save(user)));
    }

    @PutMapping("/users/{userId}/roles")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<User>> replaceRoles(
            @PathVariable UUID userId,
            @Valid @RequestBody ReplaceRolesRequest request) {
        User user = getUser_(userId);
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
        User user = getUser_(userId);
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

    private User getUser_(UUID userId) {
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
