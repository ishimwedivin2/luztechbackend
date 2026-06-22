package com.luztechnology.analytics.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LowStockItemResponse {
    private UUID id;
    private String sku;
    private String productName;
    private int quantity;
    private int lowStockThreshold;
    private String location;
}
