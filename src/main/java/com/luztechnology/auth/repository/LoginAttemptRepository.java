package com.luztechnology.auth.repository;

import com.luztechnology.auth.entity.LoginAttempt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.UUID;

@Repository
public interface LoginAttemptRepository extends JpaRepository<LoginAttempt, UUID> {
    long countByEmailIgnoreCaseAndSuccessFalseAndCreatedAtAfter(String email, LocalDateTime createdAt);
}
