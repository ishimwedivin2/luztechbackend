package com.luztechnology.crm.repository;

import com.luztechnology.crm.entity.CustomerSegment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface CustomerSegmentRepository extends JpaRepository<CustomerSegment, UUID> {
    Optional<CustomerSegment> findByName(String name);
}
