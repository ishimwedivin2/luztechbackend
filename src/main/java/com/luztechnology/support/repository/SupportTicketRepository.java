package com.luztechnology.support.repository;

import com.luztechnology.support.entity.SupportTicket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface SupportTicketRepository extends JpaRepository<SupportTicket, UUID> {
    List<SupportTicket> findByCustomerIdOrderByCreatedAtDesc(UUID customerId);

    List<SupportTicket> findByStatus(String status);

    List<SupportTicket> findByAssignedAgentId(UUID agentId);
}
