package com.luztechnology.finance.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.finance.entity.Coupon;
import com.luztechnology.finance.repository.CouponRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CouponService {

    private final CouponRepository couponRepository;

    @Transactional(readOnly = true)
    public List<Coupon> getAllCoupons() {
        return couponRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Coupon getCouponById(UUID id) {
        return couponRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Coupon not found with id: " + id));
    }

    @Transactional
    public Coupon updateCoupon(UUID id, Coupon updated) {
        Coupon existing = getCouponById(id);
        if (updated.getCode()               != null) existing.setCode(updated.getCode());
        if (updated.getType()               != null) existing.setType(updated.getType());
        if (updated.getAmount()             != null) existing.setAmount(updated.getAmount());
        if (updated.getExpiryDate()         != null) existing.setExpiryDate(updated.getExpiryDate());
        if (updated.getUsageLimit()         != null) existing.setUsageLimit(updated.getUsageLimit());
        if (updated.getMinimumOrderAmount() != null) existing.setMinimumOrderAmount(updated.getMinimumOrderAmount());
        existing.setActive(updated.isActive());
        return couponRepository.save(existing);
    }

    @Transactional(readOnly = true)
    public Coupon getCouponByCode(String code) {
        return couponRepository.findByCode(code)
                .orElseThrow(() -> new ResourceNotFoundException("Coupon not found with code: " + code));
    }

    @Transactional
    public Coupon createCoupon(Coupon coupon) {
        return couponRepository.save(coupon);
    }

    @Transactional
    public void deleteCoupon(UUID id) {
        couponRepository.deleteById(id);
    }

    public BigDecimal calculateDiscount(Coupon coupon, BigDecimal totalAmount) {
        if (!coupon.isActive() || (coupon.getExpiryDate() != null && coupon.getExpiryDate().isBefore(LocalDateTime.now()))) {
            throw new RuntimeException("Coupon is expired or inactive");
        }
        if (coupon.getUsageLimit() != null && coupon.getCurrentUsage() >= coupon.getUsageLimit()) {
            throw new RuntimeException("Coupon usage limit reached");
        }
        if (coupon.getMinimumOrderAmount() != null && totalAmount.compareTo(coupon.getMinimumOrderAmount()) < 0) {
            throw new RuntimeException("Minimum order amount not met for this coupon");
        }

        if ("PERCENTAGE".equalsIgnoreCase(coupon.getType())) {
            return totalAmount.multiply(coupon.getAmount().divide(new BigDecimal(100)));
        } else {
            return coupon.getAmount();
        }
    }

    @Transactional
    public void incrementUsage(String code) {
        Coupon coupon = getCouponByCode(code);
        coupon.setCurrentUsage(coupon.getCurrentUsage() + 1);
        couponRepository.save(coupon);
    }
}
