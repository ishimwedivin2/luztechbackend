package com.luztechnology.analytics.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "sales_reports")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SalesReport extends BaseEntity {

    @Column(nullable = false)
    private LocalDate reportDate;

    @Column(nullable = false)
    private Integer totalOrders;

    @Column(nullable = false)
    private BigDecimal totalRevenue;

    @Column(nullable = false)
    private Integer activeCustomers;

    private String reportPeriod; // DAILY, WEEKLY, MONTHLY
}
