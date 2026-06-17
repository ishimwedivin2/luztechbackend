package com.luztechnology.order.dto;

import com.luztechnology.order.entity.OrderStatus;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Data
@Builder
public class OrderTrackingResponse {
    private UUID orderId;
    private String orderNumber;
    private OrderStatus currentStatus;
    private String trackingNumber;
    private String carrier;
    private String shipmentStatus;
    private LocalDateTime estimatedDeliveryDate;
    private LocalDateTime actualDeliveryDate;
    private List<OrderTrackingEventResponse> timeline;
}
