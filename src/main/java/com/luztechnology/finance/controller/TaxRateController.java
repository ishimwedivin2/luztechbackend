package com.luztechnology.finance.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.finance.dto.TaxRateRequest;
import com.luztechnology.finance.entity.TaxRate;
import com.luztechnology.finance.service.TaxRateService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/finance/tax-rates")
@RequiredArgsConstructor
public class TaxRateController {

    private final TaxRateService taxRateService;

    @GetMapping
    public ResponseEntity<ApiResponse<List<TaxRate>>> getTaxRates(
            @RequestParam(defaultValue = "false") boolean activeOnly) {
        List<TaxRate> rates = activeOnly ? taxRateService.getActiveTaxRates() : taxRateService.getAllTaxRates();
        return ResponseEntity.ok(ApiResponse.success(rates));
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<TaxRate>> createTaxRate(@RequestBody TaxRateRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Tax rate created", taxRateService.createTaxRate(request)));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<TaxRate>> updateTaxRate(
            @PathVariable UUID id,
            @RequestBody TaxRateRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Tax rate updated", taxRateService.updateTaxRate(id, request)));
    }

    @PatchMapping("/{id}/active")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<TaxRate>> setActive(@PathVariable UUID id, @RequestParam boolean active) {
        return ResponseEntity.ok(ApiResponse.success("Tax rate status updated", taxRateService.setActive(id, active)));
    }
}
