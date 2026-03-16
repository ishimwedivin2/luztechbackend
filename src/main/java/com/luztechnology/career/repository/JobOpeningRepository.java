package com.luztechnology.career.repository;

import com.luztechnology.career.entity.JobOpening;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface JobOpeningRepository extends JpaRepository<JobOpening, UUID> {
    List<JobOpening> findByStatus(JobOpening.JobStatus status);
}
