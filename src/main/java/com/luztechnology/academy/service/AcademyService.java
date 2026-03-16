package com.luztechnology.academy.service;

import com.luztechnology.academy.entity.Course;
import com.luztechnology.academy.entity.Enrollment;
import com.luztechnology.academy.repository.CourseRepository;
import com.luztechnology.academy.repository.EnrollmentRepository;
import com.luztechnology.common.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AcademyService {

    private final CourseRepository courseRepository;
    private final EnrollmentRepository enrollmentRepository;

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public List<Course> getActiveCourses() {
        return courseRepository.findByStatus(Course.CourseStatus.ACTIVE);
    }

    public Course getCourseById(UUID id) {
        return courseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Course not found with id: " + id));
    }

    @Transactional
    public Course createCourse(Course course) {
        if (course.getStatus() == null)
            course.setStatus(Course.CourseStatus.UPCOMING);
        return courseRepository.save(course);
    }

    @Transactional
    public Course updateCourse(UUID id, Course details) {
        Course course = getCourseById(id);
        course.setTitle(details.getTitle());
        course.setDescription(details.getDescription());
        course.setInstructor(details.getInstructor());
        course.setDuration(details.getDuration());
        course.setPrice(details.getPrice());
        course.setType(details.getType());
        course.setStatus(details.getStatus());
        return courseRepository.save(course);
    }

    @Transactional
    public void deleteCourse(UUID id) {
        Course course = getCourseById(id);
        courseRepository.delete(course);
    }

    @Transactional
    public Enrollment enroll(UUID courseId, Enrollment enrollment) {
        Course course = getCourseById(courseId);
        enrollment.setCourse(course);
        if (enrollment.getStatus() == null)
            enrollment.setStatus(Enrollment.EnrollmentStatus.PENDING);
        return enrollmentRepository.save(enrollment);
    }

    public List<Enrollment> getEnrollmentsForCourse(UUID courseId) {
        return enrollmentRepository.findByCourseId(courseId);
    }

    @Transactional
    public Enrollment updateEnrollmentStatus(UUID id, Enrollment.EnrollmentStatus status) {
        Enrollment enrollment = enrollmentRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Enrollment not found with id: " + id));
        enrollment.setStatus(status);
        return enrollmentRepository.save(enrollment);
    }
}
