package com.luztechnology.order.repository;

import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderStatus;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface OrderRepository extends JpaRepository<Order, UUID> {
    Optional<Order> findByOrderNumber(String orderNumber);
    List<Order> findAllByOrderByCreatedAtDesc();

    @Query("SELECT o FROM Order o LEFT JOIN FETCH o.customer LEFT JOIN FETCH o.orderItems i LEFT JOIN FETCH i.product WHERE o.id = :id")
    Optional<Order> findByIdWithItemsAndCustomer(@Param("id") UUID id);
    List<Order> findByCustomerId(UUID customerId);
    List<Order> findByStatus(OrderStatus status);
    Page<Order> findByOrderChannelOrderByCreatedAtDesc(String orderChannel, Pageable pageable);
    List<Order> findByOrderChannelAndCreatedAtBetween(String orderChannel, LocalDateTime start, LocalDateTime end);

    @Query("""
            SELECT DISTINCT o
            FROM Order o
            LEFT JOIN o.customer c
            LEFT JOIN o.orderItems i
            LEFT JOIN i.product p
            WHERE (:status IS NULL OR o.status = :status)
              AND (:customerName IS NULL OR LOWER(CONCAT(COALESCE(c.firstName, ''), ' ', COALESCE(c.lastName, ''))) LIKE LOWER(CONCAT('%', :customerName, '%')))
              AND (:customerEmail IS NULL OR LOWER(COALESCE(c.email, '')) LIKE LOWER(CONCAT('%', :customerEmail, '%')))
              AND (:productName IS NULL OR LOWER(COALESCE(p.name, '')) LIKE LOWER(CONCAT('%', :productName, '%')))
              AND (:orderQuery IS NULL OR LOWER(COALESCE(o.orderNumber, '')) LIKE LOWER(CONCAT('%', :orderQuery, '%')))
              AND (:startDate IS NULL OR o.createdAt >= :startDate)
              AND (:endDate IS NULL OR o.createdAt < :endDate)
            ORDER BY o.createdAt DESC
            """)
    List<Order> searchOrders(
            @Param("customerName") String customerName,
            @Param("productName") String productName,
            @Param("customerEmail") String customerEmail,
            @Param("orderQuery") String orderQuery,
            @Param("status") OrderStatus status,
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate);
}
