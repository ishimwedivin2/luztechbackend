package com.luztechnology.support.repository;

import com.luztechnology.support.entity.SatisfactionSurvey;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface SatisfactionSurveyRepository extends JpaRepository<SatisfactionSurvey, UUID> {
    boolean existsByTicketId(UUID ticketId);
}
