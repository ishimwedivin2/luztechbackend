package com.luztechnology.order.repository;

import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface OrderRepository extends JpaRepository<Order, UUID> {
    Optional<Order> findByOrderNumber(String orderNumber);
    List<Order> findByCustomerId(UUID customerId);
    List<Order> findByStatus(OrderStatus status);
    Page<Order> findByOrderChannelOrderByCreatedAtDesc(String orderChannel, Pageable pageable);
    List<Order> findByOrderChannelAndCreatedAtBetween(String orderChannel, LocalDateTime start, LocalDateTime end);
}
