package com.luztechnology.admin.service;

import com.luztechnology.admin.entity.AuditLog;
import com.luztechnology.admin.repository.AuditLogRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuditService {

    private final AuditLogRepository auditLogRepository;

    public Page<AuditLog> getAllLogs(Pageable pageable) {
        return auditLogRepository.findAll(pageable);
    }

    public Page<AuditLog> getLogsByEmail(String email, Pageable pageable) {
        return auditLogRepository.findByUserEmail(email, pageable);
    }
}
