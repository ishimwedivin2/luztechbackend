package com.luztechnology.order.repository;

import com.luztechnology.order.entity.ReturnRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface ReturnRequestRepository extends JpaRepository<ReturnRequest, UUID> {
    Optional<ReturnRequest> findByOrderId(UUID orderId);
    List<ReturnRequest> findByStatus(String status);
    List<ReturnRequest> findByStatusAndCompletedAtBetween(String status, LocalDateTime startDate, LocalDateTime endDate);
}
