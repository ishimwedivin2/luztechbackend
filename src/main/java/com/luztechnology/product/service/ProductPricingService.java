package com.luztechnology.product.service;

import com.luztechnology.product.entity.Discount;
import com.luztechnology.product.entity.Product;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;

@Service
public class ProductPricingService {

    private static final BigDecimal ONE_HUNDRED = BigDecimal.valueOf(100);

    public BigDecimal originalUnitPrice(Product product) {
        return product == null || product.getPrice() == null ? BigDecimal.ZERO : product.getPrice();
    }

    public BigDecimal effectiveUnitPrice(Product product) {
        BigDecimal original = originalUnitPrice(product);
        BigDecimal percentage = activeDiscountPercentage(product);
        if (percentage == null || percentage.compareTo(BigDecimal.ZERO) <= 0) {
            return original;
        }

        BigDecimal multiplier = ONE_HUNDRED.subtract(percentage)
                .divide(ONE_HUNDRED, 6, RoundingMode.HALF_UP);
        return original.multiply(multiplier).setScale(2, RoundingMode.HALF_UP);
    }

    public BigDecimal unitDiscountAmount(Product product) {
        BigDecimal discount = originalUnitPrice(product).subtract(effectiveUnitPrice(product));
        return discount.max(BigDecimal.ZERO).setScale(2, RoundingMode.HALF_UP);
    }

    public BigDecimal activeDiscountPercentage(Product product) {
        if (product == null || product.getDiscount() == null || !isActive(product.getDiscount())) {
            return null;
        }
        return product.getDiscount().getDiscountPercentage();
    }

    public String activeDiscountName(Product product) {
        if (product == null || product.getDiscount() == null || !isActive(product.getDiscount())) {
            return null;
        }
        return product.getDiscount().getName();
    }

    public boolean isActive(Discount discount) {
        if (discount == null || !discount.isActive()) return false;
        LocalDateTime now = LocalDateTime.now();
        if (discount.getStartDate() != null && discount.getStartDate().isAfter(now)) return false;
        return discount.getEndDate() == null || !discount.getEndDate().isBefore(now);
    }
}
