package com.luztechnology.auth.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "login_attempts")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LoginAttempt extends BaseEntity {

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String ipAddress;

    @Builder.Default
    @Column(nullable = false)
    private boolean success = false;
    
    private String failureReason;
}
