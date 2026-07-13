package com.luztechnology.finance.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.finance.dto.TaxRateRequest;
import com.luztechnology.finance.entity.TaxRate;
import com.luztechnology.finance.repository.TaxRateRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class TaxRateService {

    public static final String DEFAULT_VAT_CODE = "VAT_18";

    private final TaxRateRepository taxRateRepository;

    @Transactional(readOnly = true)
    public List<TaxRate> getAllTaxRates() {
        return taxRateRepository.findAll();
    }

    @Transactional(readOnly = true)
    public List<TaxRate> getActiveTaxRates() {
        return taxRateRepository.findByActiveTrueOrderByNameAsc();
    }

    @Transactional(readOnly = true)
    public TaxRate getTaxRate(UUID id) {
        return taxRateRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Tax rate not found with id: " + id));
    }

    @Transactional(readOnly = true)
    public TaxRate getDefaultTaxRate() {
        return taxRateRepository.findByCode(DEFAULT_VAT_CODE)
                .orElseGet(() -> taxRateRepository.findAll().stream()
                        .filter(TaxRate::isActive)
                        .findFirst()
                        .orElse(null));
    }

    @Transactional
    public TaxRate createTaxRate(TaxRateRequest request) {
        TaxRate taxRate = new TaxRate();
        apply(request, taxRate);
        return taxRateRepository.save(taxRate);
    }

    @Transactional
    public TaxRate updateTaxRate(UUID id, TaxRateRequest request) {
        TaxRate taxRate = getTaxRate(id);
        apply(request, taxRate);
        return taxRateRepository.save(taxRate);
    }

    @Transactional
    public TaxRate setActive(UUID id, boolean active) {
        TaxRate taxRate = getTaxRate(id);
        taxRate.setActive(active);
        return taxRateRepository.save(taxRate);
    }

    private void apply(TaxRateRequest request, TaxRate taxRate) {
        if (request.getCode() != null) taxRate.setCode(request.getCode().trim().toUpperCase());
        if (request.getName() != null) taxRate.setName(request.getName().trim());
        if (request.getRate() != null) taxRate.setRate(request.getRate().max(BigDecimal.ZERO));
        taxRate.setDescription(request.getDescription());
        if (request.getActive() != null) taxRate.setActive(request.getActive());
    }
}
