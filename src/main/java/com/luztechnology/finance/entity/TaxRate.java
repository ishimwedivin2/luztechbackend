package com.luztechnology.finance.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "tax_rates")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TaxRate extends BaseEntity {

    @Column(nullable = false, unique = true)
    private String code;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false, precision = 5, scale = 4)
    private BigDecimal rate;

    @Column(length = 500)
    private String description;

    @Column(nullable = false)
    @Builder.Default
    private boolean active = true;
}
