package com.luztechnology.order.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "return_requests")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReturnRequest extends BaseEntity {

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "order_id", nullable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler", "orderItems"})
    private Order order;

    @Column(nullable = false)
    private String reason;

    @Column(nullable = false)
    private String status; // "PENDING", "APPROVED", "REJECTED", "COMPLETED"

    private BigDecimal requestedAmount;
    private BigDecimal refundedAmount;
    private String refundReference;
    private String refundProvider;
    private String refundStatus;
    private String adminNotes;
    private LocalDateTime approvedAt;
    private LocalDateTime refundRequestedAt;
    private LocalDateTime completedAt;
}
