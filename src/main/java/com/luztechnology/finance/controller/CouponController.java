package com.luztechnology.finance.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.finance.dto.CouponRequest;
import com.luztechnology.finance.entity.Coupon;
import com.luztechnology.finance.service.CouponService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/finance/coupons")
@RequiredArgsConstructor
public class CouponController {

    private final CouponService couponService;

    @GetMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<Coupon>>> getAllCoupons() {
        return ResponseEntity.ok(ApiResponse.success(couponService.getAllCoupons()));
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Coupon>> getCoupon(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Coupon retrieved", couponService.getCouponById(id)));
    }

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Coupon>> createCoupon(@RequestBody CouponRequest req) {
        Coupon coupon = toCoupon(req);
        return ResponseEntity.ok(ApiResponse.success("Coupon created", couponService.createCoupon(coupon)));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Coupon>> updateCoupon(@PathVariable UUID id, @RequestBody CouponRequest req) {
        return ResponseEntity.ok(ApiResponse.success("Coupon updated", couponService.updateCoupon(id, toCoupon(req))));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> deleteCoupon(@PathVariable UUID id) {
        couponService.deleteCoupon(id);
        return ResponseEntity.ok(ApiResponse.success("Coupon deleted", null));
    }

    private Coupon toCoupon(CouponRequest req) {
        Coupon c = new Coupon();
        c.setCode(req.getCode());
        c.setType(req.getDiscountType());
        c.setAmount(req.getDiscountValue());
        c.setExpiryDate(req.getExpiryDate());
        c.setActive(req.isActive());
        c.setUsageLimit(req.getUsageLimit());
        c.setMinimumOrderAmount(req.getMinimumPurchase());
        return c;
    }

    @PostMapping("/validate")
    public ResponseEntity<ApiResponse<Coupon>> validateCoupon(@RequestParam String code) {
        Coupon coupon = couponService.getCouponByCode(code);
        return ResponseEntity.ok(ApiResponse.success("Coupon is valid", coupon));
    }
}
