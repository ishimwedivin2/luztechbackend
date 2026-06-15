package com.luztechnology.inventory.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.inventory.entity.Supplier;
import com.luztechnology.inventory.service.ProcurementService;
import jakarta.validation.Valid;
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
@RequestMapping("/api/inventory/suppliers")
@RequiredArgsConstructor
@PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
public class SupplierController {

    private final ProcurementService procurementService;

    @GetMapping
    public ResponseEntity<ApiResponse<List<Supplier>>> getSuppliers(
            @RequestParam(required = false) Boolean active) {
        return ResponseEntity.ok(ApiResponse.success(procurementService.getAllSuppliers(active)));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<Supplier>> getSupplier(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success(procurementService.getSupplierById(id)));
    }

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Supplier>> createSupplier(@Valid @RequestBody Supplier supplier) {
        return ResponseEntity.ok(ApiResponse.success("Supplier created", procurementService.createSupplier(supplier)));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Supplier>> updateSupplier(
            @PathVariable UUID id,
            @Valid @RequestBody Supplier supplier) {
        return ResponseEntity.ok(ApiResponse.success("Supplier updated", procurementService.updateSupplier(id, supplier)));
    }

    @PatchMapping("/{id}/active")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Supplier>> setSupplierActive(
            @PathVariable UUID id,
            @RequestParam boolean active) {
        return ResponseEntity.ok(ApiResponse.success("Supplier status updated", procurementService.setSupplierActive(id, active)));
    }
}
