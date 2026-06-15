package com.luztechnology.support.repository;

import com.luztechnology.support.entity.ChatSession;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ChatSessionRepository extends JpaRepository<ChatSession, UUID> {
    List<ChatSession> findByStatus(String status);
    List<ChatSession> findByCustomerIdOrderByCreatedAtDesc(UUID customerId);
    List<ChatSession> findByAgentIdOrderByCreatedAtDesc(UUID agentId);
}
