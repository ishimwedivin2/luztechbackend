package com.luztechnology.academy.repository;

import com.luztechnology.academy.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface CourseRepository extends JpaRepository<Course, UUID> {
    List<Course> findByStatus(Course.CourseStatus status);

    List<Course> findByType(Course.CourseType type);
}
