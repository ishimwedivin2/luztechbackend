package com.luztechnology.finance.service;

import com.luztechnology.finance.entity.CurrencyType;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.HashMap;
import java.util.Map;

@Service
public class CurrencyService {

    // Simple hardcoded rates for now. In production, these should come from an
    // external API.
    private final Map<CurrencyType, BigDecimal> rates = new HashMap<>();

    public CurrencyService() {
        rates.put(CurrencyType.RWF, BigDecimal.ONE);
        rates.put(CurrencyType.USD, new BigDecimal("0.00078")); // 1 RWF = X USD
        rates.put(CurrencyType.EUR, new BigDecimal("0.00072")); // 1 RWF = X EUR
    }

    public BigDecimal convertFromRWF(BigDecimal amount, CurrencyType targetCurrency) {
        BigDecimal rate = rates.get(targetCurrency);
        if (rate == null)
            return amount;
        return amount.multiply(rate).setScale(2, RoundingMode.HALF_UP);
    }
}
