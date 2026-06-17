package com.luztechnology.admin.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name = "system_backups")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SystemBackup extends BaseEntity {

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String status;

    @Column(nullable = false)
    private String filePath;

    private long sizeBytes;
    private String message;
    private LocalDateTime completedAt;
    private LocalDateTime restoredAt;
}
