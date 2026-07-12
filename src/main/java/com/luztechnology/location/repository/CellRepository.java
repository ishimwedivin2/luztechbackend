package com.luztechnology.location.repository;

import com.luztechnology.location.entity.Cell;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface CellRepository extends JpaRepository<Cell, UUID> {
    List<Cell> findBySector_IdOrderByNameAsc(UUID sectorId);
    List<Cell> findBySector_IdAndEnabledTrueOrderByNameAsc(UUID sectorId);
    Optional<Cell> findFirstBySector_IdAndNameIgnoreCase(UUID sectorId, String name);
}
