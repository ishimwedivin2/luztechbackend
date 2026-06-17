package com.luztechnology.fulfillment.repository;

import com.luztechnology.fulfillment.entity.FulfillmentOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface FulfillmentOrderRepository extends JpaRepository<FulfillmentOrder, UUID> {
    Optional<FulfillmentOrder> findByOrderId(UUID orderId);
}
