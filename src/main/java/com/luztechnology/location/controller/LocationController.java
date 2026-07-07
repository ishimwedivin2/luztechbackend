package com.luztechnology.location.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.location.dto.LocationDto;
import com.luztechnology.location.service.LocationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/locations")
@RequiredArgsConstructor
public class LocationController {

    private final LocationService locationService;

    // ── Public reads (checkout / profile dropdowns) — enabled nodes only ──────

    @GetMapping("/provinces")
    public ResponseEntity<ApiResponse<List<LocationDto>>> getProvinces() {
        return ResponseEntity.ok(ApiResponse.success(locationService.getEnabledProvinces()));
    }

    @GetMapping("/{parentId}/children")
    public ResponseEntity<ApiResponse<List<LocationDto>>> getChildren(@PathVariable UUID parentId) {
        return ResponseEntity.ok(ApiResponse.success(locationService.getEnabledChildren(parentId)));
    }

    // ── Management reads (admin / employee) — includes disabled nodes ─────────

    @GetMapping("/manage/provinces")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<LocationDto>>> getAllProvinces() {
        return ResponseEntity.ok(ApiResponse.success(locationService.getAllProvinces()));
    }

    @GetMapping("/manage/{parentId}/children")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<LocationDto>>> getAllChildren(@PathVariable UUID parentId) {
        return ResponseEntity.ok(ApiResponse.success(locationService.getAllChildren(parentId)));
    }

    // ── Management mutations (admin / employee) ───────────────────────────────

    @PatchMapping("/{id}/toggle")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<LocationDto>> toggle(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Location updated", locationService.toggle(id)));
    }

    @PatchMapping("/{id}/status")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<LocationDto>> setEnabled(@PathVariable UUID id,
                                                               @RequestParam boolean enabled) {
        return ResponseEntity.ok(ApiResponse.success("Location updated", locationService.setEnabled(id, enabled)));
    }
}
