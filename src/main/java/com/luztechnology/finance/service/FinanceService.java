package com.luztechnology.finance.service;

import com.luztechnology.finance.dto.FinanceSummaryResponse;
import com.luztechnology.finance.dto.ProfitLossResponse;
import com.luztechnology.finance.entity.Expense;
import com.luztechnology.finance.entity.TaxRecord;
import com.luztechnology.finance.repository.ExpenseRepository;
import com.luztechnology.finance.repository.TaxRecordRepository;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class FinanceService {

    private final OrderRepository orderRepository;
    private final ExpenseRepository expenseRepository;
    private final TaxRecordRepository taxRecordRepository;

    @Transactional(readOnly = true)
    public FinanceSummaryResponse getSummary(LocalDate startDate, LocalDate endDate) {
        FinanceTotals totals = calculateTotals(startDate, endDate);
        return FinanceSummaryResponse.builder()
                .startDate(startDate)
                .endDate(endDate)
                .revenue(totals.revenue())
                .expenses(totals.expenses())
                .taxCollected(totals.taxCollected())
                .grossProfit(totals.revenue().subtract(totals.taxCollected()))
                .netProfit(totals.netProfit())
                .paidOrders(totals.paidOrders())
                .expenseRecords(totals.expenseRecords())
                .build();
    }

    @Transactional(readOnly = true)
    public ProfitLossResponse getProfitLoss(LocalDate startDate, LocalDate endDate) {
        FinanceTotals totals = calculateTotals(startDate, endDate);
        BigDecimal grossProfit = totals.revenue().subtract(totals.taxCollected());
        BigDecimal margin = totals.revenue().compareTo(BigDecimal.ZERO) == 0
                ? BigDecimal.ZERO
                : totals.netProfit()
                        .multiply(BigDecimal.valueOf(100))
                        .divide(totals.revenue(), 2, RoundingMode.HALF_UP);

        return ProfitLossResponse.builder()
                .startDate(startDate)
                .endDate(endDate)
                .salesRevenue(totals.revenue())
                .taxCollected(totals.taxCollected())
                .operatingExpenses(totals.expenses())
                .grossProfit(grossProfit)
                .netProfit(totals.netProfit())
                .profitMarginPercent(margin)
                .build();
    }

    private FinanceTotals calculateTotals(LocalDate startDate, LocalDate endDate) {
        List<Order> paidOrders = orderRepository.findByStatus(OrderStatus.PAID).stream()
                .filter(order -> isInsideRange(orderDate(order), startDate, endDate))
                .toList();
        List<Expense> expenses = expenseRepository.findByExpenseDateBetween(startDate, endDate);
        List<TaxRecord> taxes = taxRecordRepository.findByTaxDateBetween(startDate, endDate);

        BigDecimal revenue = paidOrders.stream()
                .map(order -> safeAmount(order.getTotalAmount()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal expenseTotal = expenses.stream()
                .map(expense -> safeAmount(expense.getAmount()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal taxCollected = taxes.stream()
                .map(tax -> safeAmount(tax.getAmount()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        return new FinanceTotals(
                revenue,
                expenseTotal,
                taxCollected,
                revenue.subtract(expenseTotal),
                paidOrders.size(),
                expenses.size());
    }

    private LocalDate orderDate(Order order) {
        return order.getCreatedAt() == null ? LocalDate.now() : order.getCreatedAt().toLocalDate();
    }

    private boolean isInsideRange(LocalDate date, LocalDate startDate, LocalDate endDate) {
        return !date.isBefore(startDate) && !date.isAfter(endDate);
    }

    private BigDecimal safeAmount(BigDecimal amount) {
        return amount == null ? BigDecimal.ZERO : amount;
    }

    private record FinanceTotals(
            BigDecimal revenue,
            BigDecimal expenses,
            BigDecimal taxCollected,
            BigDecimal netProfit,
            long paidOrders,
            long expenseRecords) {
    }
}
