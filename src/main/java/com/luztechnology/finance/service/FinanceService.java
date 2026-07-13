package com.luztechnology.finance.service;

import com.luztechnology.finance.dto.FinancialManagementResponse;
import com.luztechnology.finance.dto.FinanceSummaryResponse;
import com.luztechnology.finance.dto.ProfitLossResponse;
import com.luztechnology.finance.entity.Expense;
import com.luztechnology.finance.entity.TaxRecord;
import com.luztechnology.finance.repository.ExpenseRepository;
import com.luztechnology.finance.repository.TaxRecordRepository;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.entity.ReturnRequest;
import com.luztechnology.order.repository.OrderRepository;
import com.luztechnology.order.repository.ReturnRequestRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class FinanceService {

    private static final Set<OrderStatus> REVENUE_STATUSES = Set.of(
            OrderStatus.PAID,
            OrderStatus.PROCESSING,
            OrderStatus.SHIPPED,
            OrderStatus.DELIVERED,
            OrderStatus.RETURN_REQUESTED);
    private static final Set<OrderStatus> RECEIVABLE_STATUSES = Set.of(
            OrderStatus.PENDING,
            OrderStatus.CREATED);

    private final OrderRepository orderRepository;
    private final ExpenseRepository expenseRepository;
    private final TaxRecordRepository taxRecordRepository;
    private final ReturnRequestRepository returnRequestRepository;

    @Transactional(readOnly = true)
    public FinanceSummaryResponse getSummary(LocalDate startDate, LocalDate endDate) {
        FinanceTotals totals = calculateTotals(startDate, endDate);
        return FinanceSummaryResponse.builder()
                .startDate(startDate)
                .endDate(endDate)
                .revenue(totals.grossRevenue())
                .refunds(totals.refunds())
                .netRevenue(totals.netRevenue())
                .expenses(totals.expenses())
                .taxCollected(totals.taxCollected())
                .cogs(totals.cogs())
                .grossProfit(totals.grossProfit())
                .netProfit(totals.netProfit())
                .accountsReceivable(totals.accountsReceivable())
                .paidOrders(totals.paidOrders())
                .refundedReturns(totals.refundedReturns())
                .expenseRecords(totals.expenseRecords())
                .build();
    }

    @Transactional(readOnly = true)
    public ProfitLossResponse getProfitLoss(LocalDate startDate, LocalDate endDate) {
        FinanceTotals totals = calculateTotals(startDate, endDate);
        BigDecimal margin = totals.netRevenue().compareTo(BigDecimal.ZERO) == 0
                ? BigDecimal.ZERO
                : totals.netProfit()
                        .multiply(BigDecimal.valueOf(100))
                        .divide(totals.netRevenue(), 2, RoundingMode.HALF_UP);

        return ProfitLossResponse.builder()
                .startDate(startDate)
                .endDate(endDate)
                .salesRevenue(totals.grossRevenue())
                .refunds(totals.refunds())
                .netSales(totals.netRevenue())
                .taxCollected(totals.taxCollected())
                .cogs(totals.cogs())
                .operatingExpenses(totals.expenses())
                .grossProfit(totals.grossProfit())
                .netProfit(totals.netProfit())
                .profitMarginPercent(margin)
                .build();
    }

    @Transactional(readOnly = true)
    public FinancialManagementResponse getFinancialManagement(LocalDate startDate, LocalDate endDate) {
        FinanceTotals totals = calculateTotals(startDate, endDate);
        return FinancialManagementResponse.builder()
                .startDate(startDate)
                .endDate(endDate)
                .grossRevenue(totals.grossRevenue())
                .refunds(totals.refunds())
                .netRevenue(totals.netRevenue())
                .taxCollected(totals.taxCollected())
                .taxableRevenue(totals.taxableRevenue())
                .cogs(totals.cogs())
                .operatingExpenses(totals.expenses())
                .paidExpenses(totals.paidExpenses())
                .pendingExpenses(totals.pendingExpenses())
                .grossProfit(totals.grossProfit())
                .netProfit(totals.netProfit())
                .accountsReceivable(totals.accountsReceivable())
                .taxLiability(totals.taxCollected())
                .estimatedCashPosition(totals.netRevenue().subtract(totals.paidExpenses()))
                .revenueOrders(totals.paidOrders())
                .refundedReturns(totals.refundedReturns())
                .expenseRecords(totals.expenseRecords())
                .pendingExpenseRecords(totals.pendingExpenseRecords())
                .receivableOrders(totals.receivableOrders())
                .build();
    }

    @Transactional(readOnly = true)
    public byte[] exportFinancialManagementCsv(LocalDate startDate, LocalDate endDate) {
        FinancialManagementResponse report = getFinancialManagement(startDate, endDate);
        StringBuilder csv = new StringBuilder();
        csv.append("Metric,Amount\n");
        csv.append("Gross Revenue,").append(report.getGrossRevenue()).append('\n');
        csv.append("Refunds,").append(report.getRefunds()).append('\n');
        csv.append("Net Revenue,").append(report.getNetRevenue()).append('\n');
        csv.append("Tax Collected,").append(report.getTaxCollected()).append('\n');
        csv.append("COGS (Cost of Goods Sold),").append(report.getCogs()).append('\n');
        csv.append("Gross Profit,").append(report.getGrossProfit()).append('\n');
        csv.append("Operating Expenses,").append(report.getOperatingExpenses()).append('\n');
        csv.append("Paid Expenses,").append(report.getPaidExpenses()).append('\n');
        csv.append("Pending Expenses,").append(report.getPendingExpenses()).append('\n');
        csv.append("Net Profit,").append(report.getNetProfit()).append('\n');
        csv.append("Accounts Receivable,").append(report.getAccountsReceivable()).append('\n');
        csv.append("Tax Liability,").append(report.getTaxLiability()).append('\n');
        csv.append("Estimated Cash Position,").append(report.getEstimatedCashPosition()).append('\n');
        return csv.toString().getBytes(StandardCharsets.UTF_8);
    }

    private FinanceTotals calculateTotals(LocalDate startDate, LocalDate endDate) {
        List<Order> revenueOrders = orderRepository.findAll().stream()
                .filter(order -> REVENUE_STATUSES.contains(order.getStatus()))
                .filter(order -> isInsideRange(orderDate(order), startDate, endDate))
                .toList();
        List<Order> receivableOrders = orderRepository.findAll().stream()
                .filter(order -> RECEIVABLE_STATUSES.contains(order.getStatus()))
                .filter(order -> isInsideRange(orderDate(order), startDate, endDate))
                .toList();
        List<Expense> expenses = expenseRepository.findByExpenseDateBetween(startDate, endDate);
        List<TaxRecord> taxes = taxRecordRepository.findByTaxDateBetween(startDate, endDate);
        List<ReturnRequest> refunds = returnRequestRepository.findByStatusAndCompletedAtBetween(
                "COMPLETED",
                startDate.atStartOfDay(),
                LocalDateTime.of(endDate, LocalTime.MAX));

        BigDecimal grossRevenue = revenueOrders.stream()
                .map(order -> safeAmount(order.getTotalAmount()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal refundTotal = refunds.stream()
                .map(refund -> safeAmount(refund.getRefundedAmount()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal netRevenue = grossRevenue.subtract(refundTotal);
        BigDecimal expenseTotal = expenses.stream()
                .filter(expense -> !"PENDING".equalsIgnoreCase(expense.getStatus()))
                .map(expense -> safeAmount(expense.getAmount()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal paidExpenseTotal = expenses.stream()
                .filter(expense -> "PAID".equalsIgnoreCase(expense.getStatus()))
                .map(expense -> safeAmount(expense.getAmount()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal pendingExpenseTotal = expenses.stream()
                .filter(expense -> "PENDING".equalsIgnoreCase(expense.getStatus()))
                .map(expense -> safeAmount(expense.getAmount()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal taxCollected = taxes.stream()
                .map(tax -> safeAmount(tax.getAmount()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal taxableRevenue = taxes.stream()
                .map(tax -> safeAmount(tax.getTaxableAmount()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal accountsReceivable = receivableOrders.stream()
                .map(order -> safeAmount(order.getTotalAmount()))
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        // COGS = sum of OrderItem.lineCost (cost price × qty snapshot at time of sale)
        BigDecimal cogs = revenueOrders.stream()
                .flatMap(order -> order.getOrderItems().stream())
                .map(item -> item.getLineCost() != null ? item.getLineCost() : BigDecimal.ZERO)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        // Gross Profit = Net Revenue − COGS  (NOT netRevenue − tax)
        BigDecimal grossProfit = netRevenue.subtract(cogs);

        return new FinanceTotals(
                grossRevenue,
                refundTotal,
                netRevenue,
                expenseTotal,
                paidExpenseTotal,
                pendingExpenseTotal,
                taxCollected,
                taxableRevenue,
                accountsReceivable,
                cogs,
                grossProfit,
                grossProfit.subtract(expenseTotal),
                revenueOrders.size(),
                refunds.size(),
                expenses.size(),
                expenses.stream().filter(expense -> "PENDING".equalsIgnoreCase(expense.getStatus())).count(),
                receivableOrders.size());
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
            BigDecimal grossRevenue,
            BigDecimal refunds,
            BigDecimal netRevenue,
            BigDecimal expenses,
            BigDecimal paidExpenses,
            BigDecimal pendingExpenses,
            BigDecimal taxCollected,
            BigDecimal taxableRevenue,
            BigDecimal accountsReceivable,
            BigDecimal cogs,
            BigDecimal grossProfit,
            BigDecimal netProfit,
            long paidOrders,
            long refundedReturns,
            long expenseRecords,
            long pendingExpenseRecords,
            long receivableOrders) {
    }
}
