package com.luztechnology.career.controller;

import com.luztechnology.career.entity.JobApplication;
import com.luztechnology.career.entity.JobOpening;
import com.luztechnology.career.service.CareerService;
import com.luztechnology.common.dto.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/careers")
@RequiredArgsConstructor
public class CareerController {

    private final CareerService careerService;

    @GetMapping("/openings")
    public ResponseEntity<ApiResponse<List<JobOpening>>> getAllOpenings() {
        return ResponseEntity.ok(ApiResponse.success(careerService.getActiveOpenings()));
    }

    @GetMapping("/openings/{id}")
    public ResponseEntity<ApiResponse<JobOpening>> getOpeningById(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success(careerService.getOpeningById(id)));
    }

    @PostMapping("/openings")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<JobOpening>> createOpening(@RequestBody JobOpening opening) {
        return ResponseEntity.ok(ApiResponse.success("Job opening created", careerService.createOpening(opening)));
    }

    @PutMapping("/openings/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<JobOpening>> updateOpening(@PathVariable UUID id, @RequestBody JobOpening opening) {
        return ResponseEntity.ok(ApiResponse.success("Job opening updated", careerService.updateOpening(id, opening)));
    }

    @DeleteMapping("/openings/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> deleteOpening(@PathVariable UUID id) {
        careerService.deleteOpening(id);
        return ResponseEntity.ok(ApiResponse.success("Job opening deleted", null));
    }

    @PostMapping("/openings/{id}/apply")
    public ResponseEntity<ApiResponse<JobApplication>> applyForJob(@PathVariable UUID id,
            @RequestBody JobApplication application) {
        return ResponseEntity.ok(
                ApiResponse.success("Application submitted successfully", careerService.applyForJob(id, application)));
    }

    @GetMapping("/applications/{jobOpeningId}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<JobApplication>>> getApplications(@PathVariable UUID jobOpeningId) {
        return ResponseEntity.ok(ApiResponse.success(careerService.getApplicationsForOpening(jobOpeningId)));
    }

    @PatchMapping("/applications/{id}/status")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<JobApplication>> updateApplicationStatus(
            @PathVariable UUID id,
            @RequestParam JobApplication.ApplicationStatus status) {
        return ResponseEntity.ok(
                ApiResponse.success("Application status updated", careerService.updateApplicationStatus(id, status)));
    }
}
