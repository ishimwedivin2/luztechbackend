package com.luztechnology.finance.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "revenues")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Revenue extends BaseEntity {

    @Column(nullable = false)
    private String source; // "ORDER_SALES", "SUBSCRIPTION"

    @Column(nullable = false)
    private BigDecimal amount;

    @Column(nullable = false)
    private LocalDate revenueDate;

    private String referenceId; // order ID etc.
}
