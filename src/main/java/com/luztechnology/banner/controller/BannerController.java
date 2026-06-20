package com.luztechnology.banner.controller;

import com.luztechnology.banner.dto.BannerRequest;
import com.luztechnology.banner.entity.Banner;
import com.luztechnology.banner.service.BannerService;
import com.luztechnology.common.dto.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/banners")
@RequiredArgsConstructor
public class BannerController {

    private final BannerService bannerService;

    // Public — homepage fetches active banners without auth
    @GetMapping
    public ResponseEntity<ApiResponse<List<Banner>>> getActiveBanners() {
        return ResponseEntity.ok(ApiResponse.success(bannerService.getActiveBanners()));
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Banner>> getBanner(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Banner retrieved", bannerService.getBannerById(id)));
    }

    @GetMapping("/all")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<Banner>>> getAllBanners() {
        return ResponseEntity.ok(ApiResponse.success(bannerService.getAllBanners()));
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Banner>> createBanner(@RequestBody BannerRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Banner created", bannerService.createBanner(request)));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Banner>> updateBanner(@PathVariable UUID id,
            @RequestBody BannerRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Banner updated", bannerService.updateBanner(id, request)));
    }

    @PatchMapping("/{id}/toggle")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Banner>> toggleActive(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Banner status toggled", bannerService.toggleActive(id)));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> deleteBanner(@PathVariable UUID id) {
        bannerService.deleteBanner(id);
        return ResponseEntity.ok(ApiResponse.success("Banner deleted", null));
    }
}
