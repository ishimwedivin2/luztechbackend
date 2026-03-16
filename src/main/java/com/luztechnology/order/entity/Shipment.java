package com.luztechnology.order.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "shipments")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Shipment extends BaseEntity {

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_id", nullable = false, unique = true)
    private Order order;

    @Column(nullable = false)
    private String trackingNumber;

    @Column(nullable = false)
    private String carrier;

    @Column(nullable = false)
    private String status; // "PENDING", "IN_TRANSIT", "DELIVERED"

    private LocalDateTime estimatedDeliveryDate;
    private LocalDateTime actualDeliveryDate;
}
