package com.luztechnology.academy.repository;

import com.luztechnology.academy.entity.Enrollment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface EnrollmentRepository extends JpaRepository<Enrollment, UUID> {
    List<Enrollment> findByCourseId(UUID courseId);

    List<Enrollment> findByEmail(String email);
}
