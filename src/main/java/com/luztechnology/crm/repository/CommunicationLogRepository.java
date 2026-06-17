package com.luztechnology.crm.repository;

import com.luztechnology.crm.entity.CommunicationLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface CommunicationLogRepository extends JpaRepository<CommunicationLog, UUID> {
    List<CommunicationLog> findByCustomerIdOrderByCreatedAtDesc(UUID customerId);
}
