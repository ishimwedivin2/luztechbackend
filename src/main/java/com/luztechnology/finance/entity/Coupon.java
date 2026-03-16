package com.luztechnology.finance.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "coupons")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Coupon extends BaseEntity {

    @Column(nullable = false, unique = true)
    private String code;

    @Column(nullable = false)
    private BigDecimal amount; // Percentage or fixed value

    @Column(nullable = false)
    private String type; // FIXED, PERCENTAGE

    private LocalDateTime expiryDate;

    @Builder.Default
    private boolean active = true;

    private Integer usageLimit;

    @Builder.Default
    private Integer currentUsage = 0;

    private BigDecimal minimumOrderAmount;
}
