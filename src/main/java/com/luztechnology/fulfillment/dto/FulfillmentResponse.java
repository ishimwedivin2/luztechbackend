package com.luztechnology.fulfillment.dto;

import com.luztechnology.order.entity.OrderStatus;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@Builder
public class FulfillmentResponse {
    private UUID fulfillmentId;
    private UUID orderId;
    private String orderNumber;
    private OrderStatus orderStatus;
    private String fulfillmentStatus;
    private UUID shipmentId;
    private String trackingNumber;
    private String carrier;
    private String shipmentStatus;
    private LocalDateTime pickedAt;
    private LocalDateTime packedAt;
    private LocalDateTime dispatchedAt;
    private LocalDateTime completedAt;
}
