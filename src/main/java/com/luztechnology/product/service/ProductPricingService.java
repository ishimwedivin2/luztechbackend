package com.luztechnology.product.service;

import com.luztechnology.product.entity.Discount;
import com.luztechnology.product.entity.Product;
import com.luztechnology.finance.entity.TaxRate;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;

@Service
public class ProductPricingService {

    private static final BigDecimal ONE_HUNDRED = BigDecimal.valueOf(100);

    // ── Selling price ────────────────────────────────────────────────────────

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

    // ── Cost / Profit ────────────────────────────────────────────────────────

    /**
     * Returns the cost price (purchase price) for one unit.
     * This is internal — never exposed to customers.
     */
    public BigDecimal costPrice(Product product) {
        if (product == null || product.getCostPrice() == null) return BigDecimal.ZERO;
        return product.getCostPrice().max(BigDecimal.ZERO);
    }

    /**
     * Profit per unit = effectiveSellingPrice − costPrice.
     * Calculated on the selling price after any discount, before tax.
     */
    public BigDecimal profitPerUnit(Product product) {
        return effectiveUnitPrice(product).subtract(costPrice(product)).setScale(2, RoundingMode.HALF_UP);
    }

    /**
     * Profit margin % = (profitPerUnit / effectiveSellingPrice) × 100.
     * Returns 0 if selling price is zero.
     */
    public BigDecimal profitMarginPercent(Product product) {
        BigDecimal sellingPrice = effectiveUnitPrice(product);
        if (sellingPrice.compareTo(BigDecimal.ZERO) == 0) return BigDecimal.ZERO;
        return profitPerUnit(product)
                .multiply(ONE_HUNDRED)
                .divide(sellingPrice, 2, RoundingMode.HALF_UP);
    }

    // ── Tax ─────────────────────────────────────────────────────────────────

    public BigDecimal taxRate(Product product) {
        TaxRate taxRate = product == null ? null : product.getTaxRate();
        if (taxRate == null || taxRate.getRate() == null || !taxRate.isActive()) {
            return BigDecimal.ZERO;
        }
        return taxRate.getRate();
    }

    public BigDecimal taxAmount(BigDecimal taxableAmount, BigDecimal taxRate) {
        if (taxableAmount == null || taxRate == null) {
            return BigDecimal.ZERO;
        }
        return taxableAmount.multiply(taxRate).setScale(2, RoundingMode.HALF_UP);
    }

    public BigDecimal priceIncludingTax(BigDecimal baseAmount, BigDecimal taxRate) {
        BigDecimal amount = baseAmount == null ? BigDecimal.ZERO : baseAmount;
        return amount.add(taxAmount(amount, taxRate)).setScale(2, RoundingMode.HALF_UP);
    }

    public BigDecimal originalUnitPriceIncludingTax(Product product) {
        return priceIncludingTax(originalUnitPrice(product), taxRate(product));
    }

    public BigDecimal effectiveUnitPriceIncludingTax(Product product) {
        return priceIncludingTax(effectiveUnitPrice(product), taxRate(product));
    }

    public BigDecimal effectiveUnitTaxAmount(Product product) {
        return taxAmount(effectiveUnitPrice(product), taxRate(product));
    }

    // ── Discount helpers ─────────────────────────────────────────────────────

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
