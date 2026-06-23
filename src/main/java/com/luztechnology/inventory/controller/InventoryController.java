package com.luztechnology.inventory.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.inventory.entity.InventoryItem;
import com.luztechnology.inventory.entity.StockMovement;
import com.luztechnology.inventory.repository.StockMovementRepository;
import com.luztechnology.inventory.service.InventoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api/inventory")
@RequiredArgsConstructor
public class InventoryController {

    private final InventoryService inventoryService;
    private final StockMovementRepository stockMovementRepository;

    @GetMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<InventoryItem>>> getAllItems() {
        inventoryService.syncFromProducts(); // ensure all products have inventory records
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

    @GetMapping("/dashboard")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Map<String, Object>>> getStockDashboard() {
        return ResponseEntity.ok(ApiResponse.success("Stock dashboard retrieved",
                inventoryService.getStockDashboard()));
    }

    @GetMapping("/movements")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<StockMovement>>> getMovements(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "50") int size) {
        var pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        return ResponseEntity.ok(ApiResponse.success(stockMovementRepository.findAll(pageable).getContent()));
    }

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<InventoryItem>> createItem(@RequestBody InventoryItem item) {
        return ResponseEntity.ok(ApiResponse.success("Item created", inventoryService.addItem(item)));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<InventoryItem>> updateItem(
            @PathVariable UUID id,
            @RequestBody Map<String, Object> updates) {
        InventoryItem item = inventoryService.getItemById(id);
        if (updates.containsKey("lowStockThreshold")) {
            item.setLowStockThreshold(((Number) updates.get("lowStockThreshold")).intValue());
        }
        if (updates.containsKey("location")) {
            item.setLocation((String) updates.get("location"));
        }
        return ResponseEntity.ok(ApiResponse.success("Item updated", inventoryService.addItem(item)));
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
