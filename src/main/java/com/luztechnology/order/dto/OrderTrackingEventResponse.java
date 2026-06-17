package com.luztechnology.order.dto;

import com.luztechnology.order.entity.OrderStatus;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder
public class OrderTrackingEventResponse {
    private OrderStatus status;
    private String note;
    private LocalDateTime occurredAt;
}
