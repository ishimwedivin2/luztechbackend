package com.luztechnology.crm.repository;

import com.luztechnology.crm.entity.CustomerProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface CustomerProfileRepository extends JpaRepository<CustomerProfile, UUID> {
    Optional<CustomerProfile> findByCustomerId(UUID customerId);

    List<CustomerProfile> findByLastPurchaseDateBefore(LocalDate date);
}
