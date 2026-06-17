package com.luztechnology.crm.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.crm.dto.CommunicationLogRequest;
import com.luztechnology.crm.entity.CommunicationLog;
import com.luztechnology.crm.entity.CustomerProfile;
import com.luztechnology.crm.entity.CustomerSegment;
import com.luztechnology.crm.repository.CommunicationLogRepository;
import com.luztechnology.crm.repository.CustomerProfileRepository;
import com.luztechnology.order.entity.Order;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;
import java.util.Map;
import java.util.HashMap;
import java.math.BigDecimal;
import java.math.RoundingMode;
import com.luztechnology.order.repository.OrderRepository;
import com.luztechnology.support.repository.SupportTicketRepository;
import com.luztechnology.user.repository.UserRepository;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class CRMService {

    private final CustomerProfileRepository profileRepository;
    private final com.luztechnology.crm.repository.CustomerSegmentRepository segmentRepository;
    private final com.luztechnology.notification.service.MailService mailService;
    private final OrderRepository orderRepository;
    private final SupportTicketRepository ticketRepository;
    private final UserRepository userRepository;
    private final CommunicationLogRepository communicationLogRepository;

    public CustomerProfile getProfileByCustomerId(UUID customerId) {
        return profileRepository.findByCustomerId(customerId)
                .orElseGet(() -> {
                    com.luztechnology.user.entity.User user = userRepository.findById(customerId).orElseThrow();
                    return profileRepository.save(CustomerProfile.builder().customer(user).totalSpent(BigDecimal.ZERO).totalPurchases(0).build());
                });
    }

    @Transactional(readOnly = true)
    public Map<String, Object> getCustomerSummary(UUID customerId) {
        com.luztechnology.user.entity.User user = userRepository.findById(customerId)
                .orElseThrow(() -> new ResourceNotFoundException("Customer not found"));

        Map<String, Object> summary = new HashMap<>();
        summary.put("user", user);
        summary.put("profile", getProfileByCustomerId(customerId));
        summary.put("orders", orderRepository.findByCustomerId(customerId));
        summary.put("tickets", ticketRepository.findByCustomerIdOrderByCreatedAtDesc(customerId));
        summary.put("communicationLogs", communicationLogRepository.findByCustomerIdOrderByCreatedAtDesc(customerId));
        summary.put("analytics", getCustomerAnalytics(customerId));

        return summary;
    }

    @Transactional(readOnly = true)
    public Map<String, Object> getCustomerAnalytics(UUID customerId) {
        CustomerProfile profile = getProfileByCustomerId(customerId);
        java.util.List<Order> orders = orderRepository.findByCustomerId(customerId);
        long ticketCount = ticketRepository.findByCustomerIdOrderByCreatedAtDesc(customerId).size();
        long communicationCount = communicationLogRepository.findByCustomerIdOrderByCreatedAtDesc(customerId).size();

        BigDecimal totalSpent = orders.stream()
                .map(order -> order.getTotalAmount() == null ? BigDecimal.ZERO : order.getTotalAmount())
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal averageOrderValue = orders.isEmpty()
                ? BigDecimal.ZERO
                : totalSpent.divide(BigDecimal.valueOf(orders.size()), 2, RoundingMode.HALF_UP);
        long completedOrders = orders.stream()
                .filter(order -> order.getStatus() != null && "DELIVERED".equals(order.getStatus().name()))
                .count();
        long activeOrders = orders.stream()
                .filter(order -> order.getStatus() != null
                        && !"CANCELLED".equals(order.getStatus().name())
                        && !"DELIVERED".equals(order.getStatus().name()))
                .count();

        Map<String, Object> analytics = new HashMap<>();
        analytics.put("customerId", customerId);
        analytics.put("segment", profile.getSegment() == null ? null : profile.getSegment().getName());
        analytics.put("totalPurchases", orders.size());
        analytics.put("completedOrders", completedOrders);
        analytics.put("activeOrders", activeOrders);
        analytics.put("totalSpent", totalSpent);
        analytics.put("averageOrderValue", averageOrderValue);
        analytics.put("lastPurchaseDate", profile.getLastPurchaseDate());
        analytics.put("supportTickets", ticketCount);
        analytics.put("communicationLogs", communicationCount);
        analytics.put("engagementScore", calculateEngagementScore(orders.size(), ticketCount, communicationCount));
        return analytics;
    }

    @Transactional(readOnly = true)
    public Map<String, Object> getCrmAnalytics() {
        java.util.List<CustomerProfile> profiles = profileRepository.findAll();
        long totalCustomers = userRepository.findAll().stream()
                .filter(user -> user.getRoles().stream()
                        .anyMatch(role -> "ROLE_CUSTOMER".equals(role.getName())))
                .count();
        BigDecimal lifetimeValue = profiles.stream()
                .map(profile -> profile.getTotalSpent() == null ? BigDecimal.ZERO : profile.getTotalSpent())
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal averageLifetimeValue = totalCustomers == 0
                ? BigDecimal.ZERO
                : lifetimeValue.divide(BigDecimal.valueOf(totalCustomers), 2, RoundingMode.HALF_UP);

        Map<String, Long> segments = profiles.stream()
                .collect(java.util.stream.Collectors.groupingBy(
                        profile -> profile.getSegment() == null ? "UNSEGMENTED" : profile.getSegment().getName(),
                        java.util.stream.Collectors.counting()));

        java.time.LocalDate atRiskDate = java.time.LocalDate.now().minusDays(30);
        long atRiskCustomers = profiles.stream()
                .filter(profile -> profile.getLastPurchaseDate() != null
                        && profile.getLastPurchaseDate().isBefore(atRiskDate))
                .count();

        Map<String, Object> analytics = new HashMap<>();
        analytics.put("totalCustomers", totalCustomers);
        analytics.put("profiledCustomers", profiles.size());
        analytics.put("lifetimeValue", lifetimeValue);
        analytics.put("averageLifetimeValue", averageLifetimeValue);
        analytics.put("segments", segments);
        analytics.put("atRiskCustomers", atRiskCustomers);
        analytics.put("supportTickets", ticketRepository.count());
        analytics.put("communicationLogs", communicationLogRepository.count());
        return analytics;
    }

    @Transactional
    public CommunicationLog createCommunicationLog(CommunicationLogRequest request) {
        com.luztechnology.user.entity.User customer = userRepository.findById(request.getCustomerId())
                .orElseThrow(() -> new ResourceNotFoundException("Customer not found"));
        com.luztechnology.user.entity.User handledBy = request.getHandledById() == null
                ? null
                : userRepository.findById(request.getHandledById())
                        .orElseThrow(() -> new ResourceNotFoundException("Handler not found"));

        CommunicationLog log = CommunicationLog.builder()
                .customer(customer)
                .handledBy(handledBy)
                .channel(request.getChannel())
                .subject(request.getSubject())
                .notes(request.getNotes())
                .outcome(request.getOutcome())
                .referenceType(request.getReferenceType())
                .referenceId(request.getReferenceId())
                .build();

        return communicationLogRepository.save(log);
    }

    @Transactional(readOnly = true)
    public java.util.List<CommunicationLog> getCommunicationLogs(UUID customerId) {
        return communicationLogRepository.findByCustomerIdOrderByCreatedAtDesc(customerId);
    }

    @org.springframework.transaction.annotation.Transactional
    public void updateCustomerProfile(UUID customerId, java.math.BigDecimal orderAmount) {
        CustomerProfile profile = profileRepository.findByCustomerId(customerId)
                .orElseGet(() -> {
                    com.luztechnology.user.entity.User user = new com.luztechnology.user.entity.User();
                    user.setId(customerId);
                    return CustomerProfile.builder().customer(user).totalSpent(java.math.BigDecimal.ZERO)
                            .totalPurchases(0).build();
                });

        profile.setTotalPurchases(profile.getTotalPurchases() + 1);
        profile.setTotalSpent(profile.getTotalSpent().add(orderAmount));
        profile.setLastPurchaseDate(java.time.LocalDate.now());

        // Simple segmentation logic
        if (profile.getTotalSpent().compareTo(new java.math.BigDecimal("1000")) >= 0) {
            profile.setSegment(findOrCreateSegment("VIP", "High spending customers"));
        } else {
            profile.setSegment(findOrCreateSegment("REGULAR", "Standard customers"));
        }

        profileRepository.save(profile);
    }

    private CustomerSegment findOrCreateSegment(String name, String description) {
        return segmentRepository.findByName(name)
                .orElseGet(() -> segmentRepository
                        .save(CustomerSegment.builder().name(name).description(description).build()));
    }

    private int calculateEngagementScore(long orders, long tickets, long communicationLogs) {
        long score = (orders * 15) + (communicationLogs * 5) + Math.max(0, 20 - (tickets * 2));
        return (int) Math.min(100, score);
    }

    @org.springframework.scheduling.annotation.Scheduled(cron = "0 0 12 * * SUN") // Every Sunday at noon
    @org.springframework.transaction.annotation.Transactional
    public void identifyAtRiskCustomers() {
        java.time.LocalDate threshold = java.time.LocalDate.now().minusDays(30);
        java.util.List<CustomerProfile> atRisk = profileRepository.findByLastPurchaseDateBefore(threshold);

        CustomerSegment atRiskSegment = findOrCreateSegment("AT_RISK", "Customers who haven't ordered in 30 days");

        for (CustomerProfile profile : atRisk) {
            profile.setSegment(atRiskSegment);
            profileRepository.save(profile);

            // Send re-engagement email
            java.util.Map<String, Object> model = new java.util.HashMap<>();
            model.put("customerName", profile.getCustomer().getFirstName());
            mailService.sendEmail(profile.getCustomer().getEmail(),
                    "We Miss You - Luz Technology",
                    "reengagement-offer",
                    model);
        }
    }
}
