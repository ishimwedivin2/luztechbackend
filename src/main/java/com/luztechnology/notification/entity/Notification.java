package com.luztechnology.notification.entity;

import com.luztechnology.common.entity.BaseEntity;
import com.luztechnology.user.entity.User;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "notifications")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Notification extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String message;

    private String type; // ORDER, SUPPORT, PROMO, SYSTEM

    private String relatedId; // ID of the related order, ticket, etc.

    @Builder.Default
    private boolean read = false;
}
