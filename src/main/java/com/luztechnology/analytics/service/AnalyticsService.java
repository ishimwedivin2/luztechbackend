package com.luztechnology.analytics.service;

import com.luztechnology.analytics.dto.CustomerAnalyticsResponse;
import com.luztechnology.analytics.dto.InventoryAnalyticsResponse;
import com.luztechnology.analytics.dto.KpiDashboardResponse;
import com.luztechnology.analytics.dto.LowStockItemResponse;
import com.luztechnology.analytics.dto.MonthlyRevenueResponse;
import com.luztechnology.analytics.dto.SalesTrendPoint;
import com.luztechnology.analytics.dto.SupportAnalyticsResponse;
import com.luztechnology.analytics.dto.TopProductResponse;
import com.luztechnology.analytics.entity.SalesReport;
import com.luztechnology.analytics.repository.SalesReportRepository;
import com.luztechnology.crm.repository.CustomerProfileRepository;
import com.luztechnology.inventory.entity.InventoryItem;
import com.luztechnology.inventory.repository.InventoryItemRepository;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderItem;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.repository.OrderItemRepository;
import com.luztechnology.order.repository.OrderRepository;
import com.luztechnology.support.repository.SupportTicketRepository;
import com.luztechnology.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class AnalyticsService {

    private static final Set<OrderStatus> REVENUE_STATUSES = Set.of(
            OrderStatus.PAID,
            OrderStatus.PROCESSING,
            OrderStatus.SHIPPED,
            OrderStatus.DELIVERED,
            OrderStatus.RETURN_REQUESTED);

    private static final Set<OrderStatus> REFUND_STATUSES = Set.of(
            OrderStatus.RETURN_REQUESTED,
            OrderStatus.RETURNED,
            OrderStatus.REFUNDED);

    private final SalesReportRepository salesReportRepository;
    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;
    private final InventoryItemRepository inventoryItemRepository;
    private final CustomerProfileRepository customerProfileRepository;
    private final SupportTicketRepository supportTicketRepository;
    private final UserRepository userRepository;

    public List<SalesReport> getReportsBetween(LocalDate startDate, LocalDate endDate) {
        return salesReportRepository.findByReportDateBetween(startDate, endDate);
    }

    public Double getTotalRevenue(LocalDate startDate, LocalDate endDate) {
        return ordersBetween(startDate, endDate).stream()
                .filter(o -> o.getStatus() != null && REVENUE_STATUSES.contains(o.getStatus()))
                .map(this::safeAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add)
                .doubleValue();
    }

    public KpiDashboardResponse getFinancialDashboard() {
        LocalDate now = LocalDate.now();
        return getKpiDashboard(now.minusMonths(1), now);
    }

    public KpiDashboardResponse getKpiDashboard(LocalDate startDate, LocalDate endDate) {
        List<Order> orders = ordersBetween(startDate, endDate);
        List<Order> revenueOrders = orders.stream()
                .filter(o -> o.getStatus() != null && REVENUE_STATUSES.contains(o.getStatus()))
                .toList();

        BigDecimal totalRevenue = revenueOrders.stream()
                .map(this::safeAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal averageOrderValue = revenueOrders.isEmpty()
                ? BigDecimal.ZERO
                : totalRevenue.divide(BigDecimal.valueOf(revenueOrders.size()), 2, RoundingMode.HALF_UP);

        long refundedCount = orders.stream()
                .filter(o -> o.getStatus() != null && REFUND_STATUSES.contains(o.getStatus()))
                .count();
        BigDecimal refundRate = orders.isEmpty()
                ? BigDecimal.ZERO
                : BigDecimal.valueOf(refundedCount)
                        .multiply(BigDecimal.valueOf(100))
                        .divide(BigDecimal.valueOf(orders.size()), 2, RoundingMode.HALF_UP);

        return KpiDashboardResponse.builder()
                .startDate(startDate)
                .endDate(endDate)
                .totalRevenue(totalRevenue)
                .totalOrders(orders.size())
                .paidOrActiveOrders(revenueOrders.size())
                .averageOrderValue(averageOrderValue)
                .activeCustomers(countActiveCustomers(revenueOrders))
                .refundRate(refundRate)
                .orderStatusBreakdown(orderStatusBreakdown(orders))
                .salesTrend(salesTrend(startDate, endDate, revenueOrders))
                .topSellingProducts(topSellingProducts(revenueOrders))
                .customerAnalytics(getCustomerAnalytics())
                .inventoryAnalytics(getInventoryAnalytics())
                .supportAnalytics(getSupportAnalytics())
                .build();
    }

    public CustomerAnalyticsResponse getCustomerAnalytics() {
        long totalCustomers = userRepository.findAll().stream()
                .filter(u -> u.getRoles().stream().anyMatch(r -> "ROLE_CUSTOMER".equals(r.getName())))
                .count();
        BigDecimal lifetimeValue = customerProfileRepository.findAll().stream()
                .map(p -> p.getTotalSpent() == null ? BigDecimal.ZERO : p.getTotalSpent())
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal avgLifetimeValue = totalCustomers == 0
                ? BigDecimal.ZERO
                : lifetimeValue.divide(BigDecimal.valueOf(totalCustomers), 2, RoundingMode.HALF_UP);
        Map<String, Long> segmentBreakdown = customerProfileRepository.findAll().stream()
                .collect(Collectors.groupingBy(
                        p -> p.getSegment() == null ? "UNSEGMENTED" : p.getSegment().getName(),
                        Collectors.counting()));
        long customersWithTickets = supportTicketRepository.findAll().stream()
                .map(t -> t.getCustomer() == null ? null : t.getCustomer().getId())
                .filter(java.util.Objects::nonNull)
                .distinct()
                .count();

        return CustomerAnalyticsResponse.builder()
                .totalCustomers(totalCustomers)
                .profiledCustomers(customerProfileRepository.count())
                .lifetimeValue(lifetimeValue)
                .averageLifetimeValue(avgLifetimeValue)
                .segmentBreakdown(segmentBreakdown)
                .customersWithSupportTickets(customersWithTickets)
                .build();
    }

    public InventoryAnalyticsResponse getInventoryAnalytics() {
        List<InventoryItem> items = inventoryItemRepository.findAll();
        int totalUnits = items.stream().mapToInt(i -> safe(i.getQuantity())).sum();
        int lowStockCount = (int) items.stream()
                .filter(i -> safe(i.getQuantity()) <= safe(i.getLowStockThreshold()))
                .count();
        int outOfStockCount = (int) items.stream()
                .filter(i -> safe(i.getQuantity()) == 0)
                .count();
        BigDecimal health = items.isEmpty()
                ? BigDecimal.valueOf(100)
                : BigDecimal.valueOf(items.size() - lowStockCount)
                        .multiply(BigDecimal.valueOf(100))
                        .divide(BigDecimal.valueOf(items.size()), 2, RoundingMode.HALF_UP);

        List<LowStockItemResponse> lowStock = items.stream()
                .filter(i -> safe(i.getQuantity()) <= safe(i.getLowStockThreshold()))
                .sorted(Comparator.comparingInt(i -> safe(i.getQuantity())))
                .map(i -> LowStockItemResponse.builder()
                        .id(i.getId())
                        .sku(i.getSku())
                        .productName(i.getProductName())
                        .quantity(safe(i.getQuantity()))
                        .lowStockThreshold(safe(i.getLowStockThreshold()))
                        .location(i.getLocation())
                        .build())
                .toList();

        return InventoryAnalyticsResponse.builder()
                .totalItems(items.size())
                .totalUnits(totalUnits)
                .lowStockItems(lowStockCount)
                .outOfStockItems(outOfStockCount)
                .stockHealthPercent(health)
                .lowStock(lowStock)
                .build();
    }

    public SupportAnalyticsResponse getSupportAnalytics() {
        Map<String, Long> statusBreakdown = supportTicketRepository.findAll().stream()
                .collect(Collectors.groupingBy(
                        t -> t.getStatus() == null ? "UNKNOWN" : t.getStatus(),
                        Collectors.counting()));
        Map<String, Long> priorityBreakdown = supportTicketRepository.findAll().stream()
                .collect(Collectors.groupingBy(
                        t -> t.getPriority() == null ? "UNKNOWN" : t.getPriority(),
                        Collectors.counting()));

        return SupportAnalyticsResponse.builder()
                .totalTickets(supportTicketRepository.count())
                .statusBreakdown(statusBreakdown)
                .priorityBreakdown(priorityBreakdown)
                .build();
    }

    public List<MonthlyRevenueResponse> getMonthlyRevenue(LocalDate startDate, LocalDate endDate) {
        List<Order> revenueOrders = ordersBetween(startDate, endDate).stream()
                .filter(o -> o.getStatus() != null && REVENUE_STATUSES.contains(o.getStatus()))
                .toList();
        TreeMap<String, BigDecimal> byMonth = new TreeMap<>();
        for (Order o : revenueOrders) {
            YearMonth ym = YearMonth.from(o.getCreatedAt() == null
                    ? LocalDate.now() : o.getCreatedAt().toLocalDate());
            byMonth.merge(ym.toString(), safeAmount(o), BigDecimal::add);
        }
        return byMonth.entrySet().stream()
                .map(e -> MonthlyRevenueResponse.builder()
                        .month(e.getKey())
                        .revenue(e.getValue())
                        .build())
                .toList();
    }

    // ── Private helpers ───────────────────────────────────────

    private List<Order> ordersBetween(LocalDate startDate, LocalDate endDate) {
        return orderRepository.findAll().stream()
                .filter(o -> {
                    LocalDate d = o.getCreatedAt() == null ? LocalDate.now() : o.getCreatedAt().toLocalDate();
                    return !d.isBefore(startDate) && !d.isAfter(endDate);
                })
                .toList();
    }

    private Map<String, Long> orderStatusBreakdown(List<Order> orders) {
        return orders.stream()
                .collect(Collectors.groupingBy(
                        o -> o.getStatus() == null ? "UNKNOWN" : o.getStatus().name(),
                        Collectors.counting()));
    }

    private List<SalesTrendPoint> salesTrend(LocalDate startDate, LocalDate endDate, List<Order> orders) {
        Map<LocalDate, List<Order>> byDate = orders.stream()
                .collect(Collectors.groupingBy(o -> o.getCreatedAt() == null
                        ? LocalDate.now() : o.getCreatedAt().toLocalDate()));

        return startDate.datesUntil(endDate.plusDays(1))
                .map(date -> {
                    List<Order> dayOrders = byDate.getOrDefault(date, List.of());
                    return SalesTrendPoint.builder()
                            .date(date)
                            .orders(dayOrders.size())
                            .revenue(dayOrders.stream()
                                    .map(this::safeAmount)
                                    .reduce(BigDecimal.ZERO, BigDecimal::add))
                            .build();
                })
                .toList();
    }

    private List<TopProductResponse> topSellingProducts(List<Order> orders) {
        Set<UUID> orderIds = orders.stream().map(Order::getId).collect(Collectors.toSet());
        Map<String, List<OrderItem>> byProduct = orderItemRepository.findAll().stream()
                .filter(i -> i.getOrder() != null && orderIds.contains(i.getOrder().getId()))
                .collect(Collectors.groupingBy(i -> i.getProduct() == null
                        ? "UNKNOWN" : i.getProduct().getName()));

        return byProduct.entrySet().stream()
                .map(e -> {
                    int units = e.getValue().stream().mapToInt(i -> safe(i.getQuantity())).sum();
                    BigDecimal rev = e.getValue().stream()
                            .map(i -> i.getSubTotal() == null ? BigDecimal.ZERO : i.getSubTotal())
                            .reduce(BigDecimal.ZERO, BigDecimal::add);
                    return TopProductResponse.builder()
                            .productName(e.getKey())
                            .unitsSold(units)
                            .revenue(rev)
                            .build();
                })
                .sorted(Comparator.comparingInt(TopProductResponse::getUnitsSold).reversed())
                .limit(5)
                .toList();
    }

    private long countActiveCustomers(List<Order> orders) {
        return orders.stream()
                .map(o -> o.getCustomer() == null ? null : o.getCustomer().getId())
                .filter(java.util.Objects::nonNull)
                .distinct()
                .count();
    }

    private BigDecimal safeAmount(Order order) {
        return order.getTotalAmount() == null ? BigDecimal.ZERO : order.getTotalAmount();
    }

    private int safe(Integer value) {
        return value == null ? 0 : value;
    }
}
