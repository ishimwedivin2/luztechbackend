package com.luztechnology.location.repository;

import com.luztechnology.location.entity.District;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface DistrictRepository extends JpaRepository<District, UUID> {
    List<District> findByProvince_IdOrderByNameAsc(UUID provinceId);
    List<District> findByProvince_IdAndEnabledTrueOrderByNameAsc(UUID provinceId);
    Optional<District> findFirstByProvince_IdAndNameIgnoreCase(UUID provinceId, String name);
}
