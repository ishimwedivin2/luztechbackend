package com.luztechnology.finance.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class TaxRateRequest {
    private String code;
    private String name;
    private BigDecimal rate;
    private String description;
    private Boolean active;
}
