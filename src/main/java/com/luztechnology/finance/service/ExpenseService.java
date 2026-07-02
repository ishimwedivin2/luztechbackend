package com.luztechnology.finance.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.finance.dto.ExpenseRequest;
import com.luztechnology.finance.entity.Expense;
import com.luztechnology.finance.repository.ExpenseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ExpenseService {

    private static final Set<String> VALID_STATUSES = Set.of("PENDING", "APPROVED", "PAID");

    private final ExpenseRepository expenseRepository;

    @Transactional(readOnly = true)
    public List<Expense> getExpenses(LocalDate startDate, LocalDate endDate, String status) {
        String normalizedStatus = normalizeStatus(status);
        List<Expense> expenses;
        if (startDate != null && endDate != null) {
            expenses = expenseRepository.findByExpenseDateBetween(startDate, endDate);
        } else {
            expenses = expenseRepository.findAll();
        }

        if (normalizedStatus != null) {
            return expenses.stream()
                    .filter(expense -> normalizedStatus.equals(expense.getStatus()))
                    .toList();
        }
        return expenses;
    }

    @Transactional(readOnly = true)
    public Expense getExpense(UUID id) {
        return expenseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Expense not found"));
    }

    @Transactional
    public Expense createExpense(ExpenseRequest request) {
        Expense expense = Expense.builder()
                .category(request.getCategory())
                .amount(request.getAmount())
                .expenseDate(request.getExpenseDate())
                .description(request.getDescription())
                .status(normalizeRequiredStatus(request.getStatus()))
                .build();
        return expenseRepository.save(expense);
    }

    @Transactional
    public Expense updateExpense(UUID id, ExpenseRequest request) {
        Expense expense = getExpense(id);
        expense.setCategory(request.getCategory());
        expense.setAmount(request.getAmount());
        expense.setExpenseDate(request.getExpenseDate());
        expense.setDescription(request.getDescription());
        expense.setStatus(normalizeRequiredStatus(request.getStatus()));
        return expenseRepository.save(expense);
    }

    @Transactional
    public Expense updateStatus(UUID id, String status) {
        Expense expense = getExpense(id);
        expense.setStatus(normalizeRequiredStatus(status));
        return expenseRepository.save(expense);
    }

    @Transactional
    public void deleteExpense(UUID id) {
        Expense expense = getExpense(id);
        expenseRepository.delete(expense);
    }

    private String normalizeRequiredStatus(String status) {
        String normalized = normalizeStatus(status);
        if (normalized == null) {
            throw new IllegalArgumentException("Expense status is required");
        }
        return normalized;
    }

    private String normalizeStatus(String status) {
        if (status == null || status.isBlank()) {
            return null;
        }
        String normalized = status.trim().toUpperCase();
        if (!VALID_STATUSES.contains(normalized)) {
            throw new IllegalArgumentException("Invalid expense status: " + status);
        }
        return normalized;
    }
}
