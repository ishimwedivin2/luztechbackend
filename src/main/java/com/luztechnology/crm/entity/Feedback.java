package com.luztechnology.crm.entity;

import com.luztechnology.common.entity.BaseEntity;
import com.luztechnology.user.entity.User;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "feedbacks")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Feedback extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_id", nullable = false)
    private User customer;

    @Column(nullable = false)
    private Integer rating;

    @Column(columnDefinition = "TEXT")
    private String comments;

    // UUID string reference if feedback applies to product, order, etc.
    private String referenceId;
    private String category; 
}
