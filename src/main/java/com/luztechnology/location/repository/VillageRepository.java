package com.luztechnology.location.repository;

import com.luztechnology.location.entity.Village;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface VillageRepository extends JpaRepository<Village, UUID> {
    List<Village> findByCell_IdOrderByNameAsc(UUID cellId);
    List<Village> findByCell_IdAndEnabledTrueOrderByNameAsc(UUID cellId);
    Optional<Village> findFirstByCell_IdAndNameIgnoreCase(UUID cellId, String name);
}
