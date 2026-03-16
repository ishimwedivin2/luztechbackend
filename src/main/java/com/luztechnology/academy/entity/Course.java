package com.luztechnology.academy.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

@Entity
@Table(name = "academy_courses")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Course extends BaseEntity {

    @Column(nullable = false)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    private String instructor;

    private String duration; // e.g., "3 Months"

    private BigDecimal price; // 0 if free/internship

    @Enumerated(EnumType.STRING)
    private CourseType type;

    @Enumerated(EnumType.STRING)
    private CourseStatus status;

    public enum CourseType {
        TRAINING, INTERNSHIP, CERTIFICATION, WORKSHOP
    }

    public enum CourseStatus {
        UPCOMING, ACTIVE, COMPLETED, ARCHIVED
    }
}
