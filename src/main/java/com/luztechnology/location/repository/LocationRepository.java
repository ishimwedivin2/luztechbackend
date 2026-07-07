package com.luztechnology.location.repository;

import com.luztechnology.location.entity.Location;
import com.luztechnology.location.entity.LocationType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface LocationRepository extends JpaRepository<Location, UUID> {

    // Top-level (provinces have no parent)
    List<Location> findByTypeAndParentIsNullOrderByNameAsc(LocationType type);

    List<Location> findByTypeAndParentIsNullAndEnabledTrueOrderByNameAsc(LocationType type);

    // Children of a given node
    List<Location> findByParent_IdOrderByNameAsc(UUID parentId);

    List<Location> findByParent_IdAndEnabledTrueOrderByNameAsc(UUID parentId);

    // Name-based lookups — used to validate a shipping address against the tree
    Optional<Location> findFirstByParentIsNullAndNameIgnoreCase(String name);

    Optional<Location> findFirstByParent_IdAndNameIgnoreCase(UUID parentId, String name);
}
