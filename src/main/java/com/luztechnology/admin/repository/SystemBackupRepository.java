package com.luztechnology.admin.repository;

import com.luztechnology.admin.entity.SystemBackup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface SystemBackupRepository extends JpaRepository<SystemBackup, UUID> {
    List<SystemBackup> findAllByOrderByCreatedAtDesc();
}
