package com.luztechnology.inventory.repository;

import com.luztechnology.inventory.entity.ProcurementOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface ProcurementOrderRepository extends JpaRepository<ProcurementOrder, UUID> {
}
