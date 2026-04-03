package com.luztechnology.product.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.product.entity.Discount;
import com.luztechnology.product.service.DiscountService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/products/discounts")
@RequiredArgsConstructor
public class DiscountController {

    private final DiscountService discountService;

    @GetMapping
    public ResponseEntity<ApiResponse<List<Discount>>> getAllDiscounts() {
        return ResponseEntity.ok(ApiResponse.success(discountService.getAllDiscounts()));
    }

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Discount>> createDiscount(@RequestBody Discount discount) {
        return ResponseEntity.ok(ApiResponse.success("Discount created", discountService.createDiscount(discount)));
    }

    @PatchMapping("/{id}/toggle")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Discount>> toggleActive(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Discount status toggled", discountService.toggleActive(id)));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> deleteDiscount(@PathVariable UUID id) {
        discountService.deleteDiscount(id);
        return ResponseEntity.ok(ApiResponse.success("Discount deleted", null));
    }
}
