package com.luztechnology.analytics.service;

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
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
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
        Double total = salesReportRepository.calculateTotalRevenueBetween(startDate, endDate);
        return total != null ? total : 0.0;
    }

    public Map<String, Object> getFinancialDashboard() {
        LocalDate now = LocalDate.now();
        LocalDate lastMonth = now.minusMonths(1);
        return getKpiDashboard(lastMonth, now);
    }

    public Map<String, Object> getKpiDashboard(LocalDate startDate, LocalDate endDate) {
        List<Order> orders = ordersBetween(startDate, endDate);
        List<Order> revenueOrders = orders.stream()
                .filter(order -> order.getStatus() != null && REVENUE_STATUSES.contains(order.getStatus()))
                .toList();
        BigDecimal totalRevenue = revenueOrders.stream()
                .map(this::safeOrderAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal averageOrderValue = revenueOrders.isEmpty()
                ? BigDecimal.ZERO
                : totalRevenue.divide(BigDecimal.valueOf(revenueOrders.size()), 2, RoundingMode.HALF_UP);

        Map<String, Object> dashboard = new HashMap<>();
        dashboard.put("startDate", startDate);
        dashboard.put("endDate", endDate);
        dashboard.put("totalRevenue", totalRevenue);
        dashboard.put("totalOrders", orders.size());
        dashboard.put("paidOrActiveOrders", revenueOrders.size());
        dashboard.put("averageOrderValue", averageOrderValue);
        dashboard.put("activeCustomers", countActiveCustomers(revenueOrders));
        dashboard.put("orderStatusBreakdown", orderStatusBreakdown(orders));
        dashboard.put("salesTrend", salesTrend(startDate, endDate, revenueOrders));
        dashboard.put("topSellingProducts", topSellingProducts(revenueOrders));
        dashboard.put("customerAnalytics", getCustomerAnalytics());
        dashboard.put("inventoryAnalytics", getInventoryAnalytics());
        dashboard.put("supportAnalytics", getSupportAnalytics());

        return dashboard;
    }

    public Map<String, Object> getCustomerAnalytics() {
        long totalCustomers = userRepository.findAll().stream()
                .filter(user -> user.getRoles().stream()
                        .anyMatch(role -> "ROLE_CUSTOMER".equals(role.getName())))
                .count();
        BigDecimal lifetimeValue = customerProfileRepository.findAll().stream()
                .map(profile -> profile.getTotalSpent() == null ? BigDecimal.ZERO : profile.getTotalSpent())
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal averageLifetimeValue = totalCustomers == 0
                ? BigDecimal.ZERO
                : lifetimeValue.divide(BigDecimal.valueOf(totalCustomers), 2, RoundingMode.HALF_UP);

        Map<String, Long> segmentBreakdown = customerProfileRepository.findAll().stream()
                .collect(Collectors.groupingBy(
                        profile -> profile.getSegment() == null ? "UNSEGMENTED" : profile.getSegment().getName(),
                        Collectors.counting()));

        Map<String, Object> analytics = new HashMap<>();
        analytics.put("totalCustomers", totalCustomers);
        analytics.put("profiledCustomers", customerProfileRepository.count());
        analytics.put("lifetimeValue", lifetimeValue);
        analytics.put("averageLifetimeValue", averageLifetimeValue);
        analytics.put("segmentBreakdown", segmentBreakdown);
        analytics.put("customersWithSupportTickets", supportTicketRepository.findAll().stream()
                .map(ticket -> ticket.getCustomer() == null ? null : ticket.getCustomer().getId())
                .filter(java.util.Objects::nonNull)
                .distinct()
                .count());
        return analytics;
    }

    public Map<String, Object> getInventoryAnalytics() {
        List<InventoryItem> items = inventoryItemRepository.findAll();
        int totalUnits = items.stream().mapToInt(item -> safeInteger(item.getQuantity())).sum();
        int lowStockItems = (int) items.stream()
                .filter(item -> safeInteger(item.getQuantity()) <= safeInteger(item.getLowStockThreshold()))
                .count();
        int outOfStockItems = (int) items.stream()
                .filter(item -> safeInteger(item.getQuantity()) == 0)
                .count();

        List<Map<String, Object>> lowStock = items.stream()
                .filter(item -> safeInteger(item.getQuantity()) <= safeInteger(item.getLowStockThreshold()))
                .sorted(Comparator.comparingInt(item -> safeInteger(item.getQuantity())))
                .map(item -> {
                    Map<String, Object> row = new HashMap<>();
                    row.put("id", item.getId());
                    row.put("sku", item.getSku());
                    row.put("productName", item.getProductName());
                    row.put("quantity", item.getQuantity());
                    row.put("lowStockThreshold", item.getLowStockThreshold());
                    row.put("location", item.getLocation());
                    return row;
                })
                .toList();

        Map<String, Object> analytics = new HashMap<>();
        analytics.put("totalItems", items.size());
        analytics.put("totalUnits", totalUnits);
        analytics.put("lowStockItems", lowStockItems);
        analytics.put("outOfStockItems", outOfStockItems);
        analytics.put("stockHealthPercent", items.isEmpty()
                ? 100
                : BigDecimal.valueOf(items.size() - lowStockItems)
                        .multiply(BigDecimal.valueOf(100))
                        .divide(BigDecimal.valueOf(items.size()), 2, RoundingMode.HALF_UP));
        analytics.put("lowStock", lowStock);
        return analytics;
    }

    public Map<String, Object> getSupportAnalytics() {
        Map<String, Long> ticketStatusBreakdown = supportTicketRepository.findAll().stream()
                .collect(Collectors.groupingBy(ticket -> ticket.getStatus() == null ? "UNKNOWN" : ticket.getStatus(),
                        Collectors.counting()));
        Map<String, Long> ticketPriorityBreakdown = supportTicketRepository.findAll().stream()
                .collect(Collectors.groupingBy(ticket -> ticket.getPriority() == null ? "UNKNOWN" : ticket.getPriority(),
                        Collectors.counting()));

        Map<String, Object> analytics = new HashMap<>();
        analytics.put("totalTickets", supportTicketRepository.count());
        analytics.put("statusBreakdown", ticketStatusBreakdown);
        analytics.put("priorityBreakdown", ticketPriorityBreakdown);
        return analytics;
    }

    public List<Map<String, Object>> getMonthlyRevenue(LocalDate startDate, LocalDate endDate) {
        List<Order> revenueOrders = ordersBetween(startDate, endDate).stream()
                .filter(o -> o.getStatus() != null && REVENUE_STATUSES.contains(o.getStatus()))
                .toList();
        java.util.TreeMap<String, BigDecimal> byMonth = new java.util.TreeMap<>();
        for (Order o : revenueOrders) {
            java.time.YearMonth ym = java.time.YearMonth.from(
                    o.getCreatedAt() == null ? LocalDate.now() : o.getCreatedAt().toLocalDate());
            byMonth.merge(ym.toString(), safeOrderAmount(o), BigDecimal::add);
        }
        return byMonth.entrySet().stream()
                .map(e -> {
                    Map<String, Object> row = new HashMap<>();
                    row.put("month", e.getKey());
                    row.put("revenue", e.getValue());
                    return row;
                })
                .toList();
    }

    private List<Order> ordersBetween(LocalDate startDate, LocalDate endDate) {
        return orderRepository.findAll().stream()
                .filter(order -> {
                    LocalDate orderDate = order.getCreatedAt() == null ? LocalDate.now() : order.getCreatedAt().toLocalDate();
                    return !orderDate.isBefore(startDate) && !orderDate.isAfter(endDate);
                })
                .toList();
    }

    private Map<String, Long> orderStatusBreakdown(List<Order> orders) {
        return orders.stream()
                .collect(Collectors.groupingBy(order -> order.getStatus() == null ? "UNKNOWN" : order.getStatus().name(),
                        Collectors.counting()));
    }

    private List<Map<String, Object>> salesTrend(LocalDate startDate, LocalDate endDate, List<Order> orders) {
        Map<LocalDate, List<Order>> ordersByDate = orders.stream()
                .collect(Collectors.groupingBy(order -> order.getCreatedAt() == null
                        ? LocalDate.now()
                        : order.getCreatedAt().toLocalDate()));

        return startDate.datesUntil(endDate.plusDays(1))
                .map(date -> {
                    List<Order> dayOrders = ordersByDate.getOrDefault(date, List.of());
                    Map<String, Object> row = new HashMap<>();
                    row.put("date", date);
                    row.put("orders", dayOrders.size());
                    row.put("revenue", dayOrders.stream()
                            .map(this::safeOrderAmount)
                            .reduce(BigDecimal.ZERO, BigDecimal::add));
                    return row;
                })
                .toList();
    }

    private List<Map<String, Object>> topSellingProducts(List<Order> orders) {
        Set<java.util.UUID> orderIds = orders.stream()
                .map(Order::getId)
                .collect(Collectors.toSet());

        Map<String, List<OrderItem>> itemsByProduct = orderItemRepository.findAll().stream()
                .filter(item -> item.getOrder() != null && orderIds.contains(item.getOrder().getId()))
                .collect(Collectors.groupingBy(item -> item.getProduct() == null
                        ? "UNKNOWN"
                        : item.getProduct().getName()));

        return itemsByProduct.entrySet().stream()
                .map(entry -> {
                    int unitsSold = entry.getValue().stream()
                            .mapToInt(item -> safeInteger(item.getQuantity()))
                            .sum();
                    BigDecimal revenue = entry.getValue().stream()
                            .map(item -> item.getSubTotal() == null ? BigDecimal.ZERO : item.getSubTotal())
                            .reduce(BigDecimal.ZERO, BigDecimal::add);
                    Map<String, Object> row = new HashMap<>();
                    row.put("productName", entry.getKey());
                    row.put("unitsSold", unitsSold);
                    row.put("revenue", revenue);
                    return row;
                })
                .sorted((left, right) -> Integer.compare((Integer) right.get("unitsSold"), (Integer) left.get("unitsSold")))
                .limit(5)
                .toList();
    }

    private long countActiveCustomers(List<Order> orders) {
        return orders.stream()
                .map(order -> order.getCustomer() == null ? null : order.getCustomer().getId())
                .filter(java.util.Objects::nonNull)
                .distinct()
                .count();
    }

    private BigDecimal safeOrderAmount(Order order) {
        return order.getTotalAmount() == null ? BigDecimal.ZERO : order.getTotalAmount();
    }

    private int safeInteger(Integer value) {
        return value == null ? 0 : value;
    }
}
