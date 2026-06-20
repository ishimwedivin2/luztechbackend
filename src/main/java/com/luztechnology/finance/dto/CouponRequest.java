package com.luztechnology.finance.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class CouponRequest {

    private String code;

    /** Frontend field name: discountType  →  Coupon.type */
    private String discountType;

    /** Frontend field name: discountValue →  Coupon.amount */
    private BigDecimal discountValue;

    private LocalDateTime expiryDate;

    private boolean active = true;

    private Integer usageLimit;

    /** Frontend field name: minimumPurchase  →  Coupon.minimumOrderAmount */
    private BigDecimal minimumPurchase;
}
