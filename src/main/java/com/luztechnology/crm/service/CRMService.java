package com.luztechnology.crm.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.crm.entity.CustomerProfile;
import com.luztechnology.crm.entity.CustomerSegment;
import com.luztechnology.crm.repository.CustomerProfileRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.time.LocalDate;
import java.math.BigDecimal;
import com.luztechnology.order.repository.OrderRepository;
import com.luztechnology.support.repository.SupportTicketRepository;
import com.luztechnology.academy.repository.EnrollmentRepository;
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
    private final EnrollmentRepository enrollmentRepository;
    private final UserRepository userRepository;

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
        summary.put("enrollments", enrollmentRepository.findByEmail(user.getEmail()));

        return summary;
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
