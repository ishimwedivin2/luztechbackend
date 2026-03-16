package com.luztechnology.career.service;

import com.luztechnology.career.entity.JobApplication;
import com.luztechnology.career.entity.JobOpening;
import com.luztechnology.career.repository.JobApplicationRepository;
import com.luztechnology.career.repository.JobOpeningRepository;
import com.luztechnology.common.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CareerService {

    private final JobOpeningRepository jobOpeningRepository;
    private final JobApplicationRepository jobApplicationRepository;

    public List<JobOpening> getAllOpenings() {
        return jobOpeningRepository.findAll();
    }

    public List<JobOpening> getActiveOpenings() {
        return jobOpeningRepository.findByStatus(JobOpening.JobStatus.OPEN);
    }

    public JobOpening getOpeningById(UUID id) {
        return jobOpeningRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Job opening not found with id: " + id));
    }

    @Transactional
    public JobOpening createOpening(JobOpening opening) {
        if (opening.getStatus() == null)
            opening.setStatus(JobOpening.JobStatus.OPEN);
        return jobOpeningRepository.save(opening);
    }

    @Transactional
    public JobOpening updateOpening(UUID id, JobOpening details) {
        JobOpening opening = getOpeningById(id);
        opening.setTitle(details.getTitle());
        opening.setDescription(details.getDescription());
        opening.setRequirements(details.getRequirements());
        opening.setLocation(details.getLocation());
        opening.setSalaryRange(details.getSalaryRange());
        opening.setType(details.getType());
        opening.setStatus(details.getStatus());
        return jobOpeningRepository.save(opening);
    }

    @Transactional
    public void deleteOpening(UUID id) {
        JobOpening opening = getOpeningById(id);
        jobOpeningRepository.delete(opening);
    }

    @Transactional
    public JobOpening updateStatus(UUID id, JobOpening.JobStatus status) {
        JobOpening opening = getOpeningById(id);
        opening.setStatus(status);
        return jobOpeningRepository.save(opening);
    }

    @Transactional
    public JobApplication applyForJob(UUID jobOpeningId, JobApplication application) {
        JobOpening opening = getOpeningById(jobOpeningId);
        application.setJobOpening(opening);
        if (application.getStatus() == null)
            application.setStatus(JobApplication.ApplicationStatus.PENDING);
        return jobApplicationRepository.save(application);
    }

    public List<JobApplication> getApplicationsForOpening(UUID jobOpeningId) {
        return jobApplicationRepository.findByJobOpeningId(jobOpeningId);
    }

    @Transactional
    public JobApplication updateApplicationStatus(UUID id, JobApplication.ApplicationStatus status) {
        JobApplication application = jobApplicationRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Application not found with id: " + id));
        application.setStatus(status);
        return jobApplicationRepository.save(application);
    }
}
