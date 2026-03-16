package com.luztechnology.academy.controller;

import com.luztechnology.academy.entity.Course;
import com.luztechnology.academy.entity.Enrollment;
import com.luztechnology.academy.service.AcademyService;
import com.luztechnology.common.dto.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/academy")
@RequiredArgsConstructor
public class AcademyController {

    private final AcademyService academyService;

    @GetMapping("/courses")
    public ResponseEntity<ApiResponse<List<Course>>> getAllCourses() {
        return ResponseEntity.ok(ApiResponse.success(academyService.getAllCourses()));
    }

    @GetMapping("/courses/{id}")
    public ResponseEntity<ApiResponse<Course>> getCourseById(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success(academyService.getCourseById(id)));
    }

    @PostMapping("/courses")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Course>> createCourse(@RequestBody Course course) {
        return ResponseEntity
                .ok(ApiResponse.success("Course created successfully", academyService.createCourse(course)));
    }

    @PutMapping("/courses/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Course>> updateCourse(@PathVariable UUID id, @RequestBody Course course) {
        return ResponseEntity
                .ok(ApiResponse.success("Course updated successfully", academyService.updateCourse(id, course)));
    }

    @DeleteMapping("/courses/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> deleteCourse(@PathVariable UUID id) {
        academyService.deleteCourse(id);
        return ResponseEntity.ok(ApiResponse.success("Course deleted successfully", null));
    }

    @PostMapping("/courses/{id}/enroll")
    public ResponseEntity<ApiResponse<Enrollment>> enroll(@PathVariable UUID id, @RequestBody Enrollment enrollment) {
        return ResponseEntity
                .ok(ApiResponse.success("Enrollment request submitted", academyService.enroll(id, enrollment)));
    }

    @GetMapping("/enrollments/{courseId}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<Enrollment>>> getEnrollments(@PathVariable UUID courseId) {
        return ResponseEntity.ok(ApiResponse.success(academyService.getEnrollmentsForCourse(courseId)));
    }

    @PatchMapping("/enrollments/{id}/status")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Enrollment>> updateEnrollmentStatus(
            @PathVariable UUID id,
            @RequestParam Enrollment.EnrollmentStatus status) {
        return ResponseEntity.ok(
                ApiResponse.success("Enrollment status updated", academyService.updateEnrollmentStatus(id, status)));
    }
}
