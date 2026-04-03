package com.luztechnology.product.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.product.entity.Discount;
import com.luztechnology.product.repository.DiscountRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class DiscountService {

    private final DiscountRepository discountRepository;

    @Transactional(readOnly = true)
    public List<Discount> getAllDiscounts() {
        return discountRepository.findAll();
    }

    @Transactional
    public Discount createDiscount(Discount discount) {
        return discountRepository.save(discount);
    }

    @Transactional
    public void deleteDiscount(UUID id) {
        discountRepository.deleteById(id);
    }

    @Transactional
    public Discount toggleActive(UUID id) {
        Discount discount = discountRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Discount not found"));
        discount.setActive(!discount.isActive());
        return discountRepository.save(discount);
    }
}
