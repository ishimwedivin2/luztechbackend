package com.luztechnology.location.repository;

import com.luztechnology.location.entity.Sector;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface SectorRepository extends JpaRepository<Sector, UUID> {
    List<Sector> findByDistrict_IdOrderByNameAsc(UUID districtId);
    List<Sector> findByDistrict_IdAndEnabledTrueOrderByNameAsc(UUID districtId);
    Optional<Sector> findFirstByDistrict_IdAndNameIgnoreCase(UUID districtId, String name);
}
