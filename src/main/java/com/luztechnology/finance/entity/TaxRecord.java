package com.luztechnology.finance.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.UUID;

@Entity
@Table(name = "tax_records")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TaxRecord extends BaseEntity {

    @Column(nullable = false)
    private String taxType; // "VAT", "INCOME_TAX"

    @Column(nullable = false)
    private BigDecimal amount;

    private BigDecimal taxableAmount;
    private BigDecimal taxRate;

    private UUID orderId;
    private String orderNumber;

    @Column(nullable = false)
    private LocalDate filingDate;

    private LocalDate taxDate;

    private String status; // "PENDING", "FILED", "PAID"
    private String referenceId;
}
