package com.luztechnology.inventory.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.inventory.entity.InventoryItem;
import com.luztechnology.inventory.service.InventoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/inventory")
@RequiredArgsConstructor
public class InventoryController {

    private final InventoryService inventoryService;

    @GetMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<InventoryItem>>> getAllItems() {
        return ResponseEntity.ok(ApiResponse.success(inventoryService.getAllItems()));
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<InventoryItem>> getItemById(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success(inventoryService.getItemById(id)));
    }

    @GetMapping("/low-stock")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<InventoryItem>>> getLowStockItems() {
        return ResponseEntity.ok(ApiResponse.success(inventoryService.getLowStockItems()));
    }

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<InventoryItem>> createItem(@RequestBody InventoryItem item) {
        return ResponseEntity.ok(ApiResponse.success("Item created", inventoryService.addItem(item)));
    }

    @PostMapping("/{id}/adjust")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<InventoryItem>> adjustStock(
            @PathVariable UUID id,
            @RequestParam int quantity,
            @RequestParam String reason,
            @RequestParam String type,
            @RequestParam(required = false) String referenceId) {
        InventoryItem adjustedItem = inventoryService.adjustStock(id, quantity, reason, type, referenceId);
        return ResponseEntity.ok(ApiResponse.success("Stock adjusted successfully", adjustedItem));
    }
}
