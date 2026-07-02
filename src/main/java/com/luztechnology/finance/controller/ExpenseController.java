package com.luztechnology.finance.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.finance.dto.ExpenseRequest;
import com.luztechnology.finance.entity.Expense;
import com.luztechnology.finance.service.ExpenseService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api/finance/expenses")
@RequiredArgsConstructor
@PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
public class ExpenseController {

    private final ExpenseService expenseService;

    @GetMapping
    public ResponseEntity<ApiResponse<List<Expense>>> getExpenses(
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam(required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
            @RequestParam(required = false) String status) {
        return ResponseEntity.ok(ApiResponse.success("Expenses retrieved",
                expenseService.getExpenses(startDate, endDate, status)));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<Expense>> getExpense(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Expense retrieved", expenseService.getExpense(id)));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<Expense>> createExpense(@Valid @RequestBody ExpenseRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Expense created", expenseService.createExpense(request)));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ApiResponse<Expense>> updateExpense(
            @PathVariable UUID id,
            @Valid @RequestBody ExpenseRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Expense updated", expenseService.updateExpense(id, request)));
    }

    @PatchMapping("/{id}/status")
    public ResponseEntity<ApiResponse<Expense>> updateStatus(
            @PathVariable UUID id,
            @RequestBody(required = false) Map<String, String> request,
            @RequestParam(required = false) String status) {
        String requestedStatus = request != null && request.containsKey("status")
                ? request.get("status")
                : status;
        return ResponseEntity.ok(ApiResponse.success("Expense status updated",
                expenseService.updateStatus(id, requestedStatus)));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Object>> deleteExpense(@PathVariable UUID id) {
        expenseService.deleteExpense(id);
        return ResponseEntity.ok(ApiResponse.success("Expense deleted", null));
    }
}
