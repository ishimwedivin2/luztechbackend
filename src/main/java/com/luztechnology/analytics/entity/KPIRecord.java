package com.luztechnology.analytics.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "kpi_records")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class KPIRecord extends BaseEntity {

    @Column(nullable = false)
    private LocalDate recordDate;

    @Column(nullable = false)
    private String metricName; // "CUSTOMER_ACQUISITION_COST", "LIFETIME_VALUE"

    @Column(nullable = false)
    private BigDecimal metricValue;

    private String description;
}
