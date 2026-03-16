package com.luztechnology.admin.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "audit_logs")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AuditLog extends BaseEntity {

    private String userEmail;

    @Column(nullable = false)
    private String action; // e.g., "USER_LOGIN", "DATA_EXPORT"

    @Column(nullable = false)
    private String resource; // e.g., "/api/users"

    @Column(nullable = false)
    private String ipAddress;

    private String details;

    @Builder.Default
    private LocalDateTime timestamp = LocalDateTime.now();
    
    private String status; // "SUCCESS", "FAILURE"
}
