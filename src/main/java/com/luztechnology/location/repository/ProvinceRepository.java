package com.luztechnology.location.repository;

import com.luztechnology.location.entity.Province;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface ProvinceRepository extends JpaRepository<Province, UUID> {
    List<Province> findByOrderByNameAsc();
    List<Province> findByEnabledTrueOrderByNameAsc();
    Optional<Province> findFirstByNameIgnoreCase(String name);
}
