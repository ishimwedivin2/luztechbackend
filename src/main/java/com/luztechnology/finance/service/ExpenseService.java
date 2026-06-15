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
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ExpenseService {

    private final ExpenseRepository expenseRepository;

    @Transactional(readOnly = true)
    public List<Expense> getExpenses(LocalDate startDate, LocalDate endDate, String status) {
        if (status != null && !status.isBlank()) {
            return expenseRepository.findByStatus(status);
        }
        if (startDate != null && endDate != null) {
            return expenseRepository.findByExpenseDateBetween(startDate, endDate);
        }
        return expenseRepository.findAll();
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
                .status(request.getStatus())
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
        expense.setStatus(request.getStatus());
        return expenseRepository.save(expense);
    }

    @Transactional
    public Expense updateStatus(UUID id, String status) {
        Expense expense = getExpense(id);
        expense.setStatus(status);
        return expenseRepository.save(expense);
    }

    @Transactional
    public void deleteExpense(UUID id) {
        Expense expense = getExpense(id);
        expenseRepository.delete(expense);
    }
}
