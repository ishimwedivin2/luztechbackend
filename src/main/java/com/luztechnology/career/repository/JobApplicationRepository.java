package com.luztechnology.career.repository;

import com.luztechnology.career.entity.JobApplication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface JobApplicationRepository extends JpaRepository<JobApplication, UUID> {
    List<JobApplication> findByJobOpeningId(UUID jobOpeningId);

    List<JobApplication> findByEmail(String email);
}
