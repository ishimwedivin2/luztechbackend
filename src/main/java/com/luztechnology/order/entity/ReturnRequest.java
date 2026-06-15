package com.luztechnology.order.entity;

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

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;

    @Column(nullable = false)
    private String reason;

    @Column(nullable = false)
    private String status; // "PENDING", "APPROVED", "REJECTED", "COMPLETED"

    private BigDecimal requestedAmount;
    private BigDecimal refundedAmount;
    private String refundReference;
    private String adminNotes;
    private LocalDateTime approvedAt;
    private LocalDateTime completedAt;
}
