package com.luztechnology.support.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "satisfaction_surveys")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SatisfactionSurvey extends BaseEntity {

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ticket_id", nullable = false, unique = true)
    private SupportTicket ticket;

    @Column(nullable = false)
    private Integer rating; // 1 to 5

    @Column(columnDefinition = "TEXT")
    private String feedback;
}
