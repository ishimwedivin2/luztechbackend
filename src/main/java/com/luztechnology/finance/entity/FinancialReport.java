package com.luztechnology.finance.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "financial_reports")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FinancialReport extends BaseEntity {

    @Column(nullable = false)
    private String reportPeriod; // "JAN-2026", "Q1-2026"

    @Column(nullable = false)
    private BigDecimal totalRevenue;

    @Column(nullable = false)
    private BigDecimal totalExpenses;

    @Column(nullable = false)
    private BigDecimal netProfit;

    private LocalDate generatedDate;
}
