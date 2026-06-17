package com.luztechnology.order.repository;

import com.luztechnology.order.entity.OrderTrackingEvent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface OrderTrackingEventRepository extends JpaRepository<OrderTrackingEvent, UUID> {
    List<OrderTrackingEvent> findByOrderIdOrderByCreatedAtAsc(UUID orderId);
}
