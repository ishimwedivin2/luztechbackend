package com.luztechnology.location.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.location.dto.LocationDto;
import com.luztechnology.location.entity.Location;
import com.luztechnology.location.entity.LocationType;
import com.luztechnology.location.repository.LocationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class LocationService {

    private final LocationRepository locationRepository;

    // ── Public (customer) reads — enabled nodes only ──────────────────────────

    @Transactional(readOnly = true)
    public List<LocationDto> getEnabledProvinces() {
        return locationRepository
                .findByTypeAndParentIsNullAndEnabledTrueOrderByNameAsc(LocationType.PROVINCE)
                .stream().map(LocationDto::of).toList();
    }

    @Transactional(readOnly = true)
    public List<LocationDto> getEnabledChildren(UUID parentId) {
        return locationRepository
                .findByParent_IdAndEnabledTrueOrderByNameAsc(parentId)
                .stream().map(LocationDto::of).toList();
    }

    // ── Management (admin / employee) reads — includes disabled nodes ─────────

    @Transactional(readOnly = true)
    public List<LocationDto> getAllProvinces() {
        return locationRepository
                .findByTypeAndParentIsNullOrderByNameAsc(LocationType.PROVINCE)
                .stream().map(LocationDto::of).toList();
    }

    @Transactional(readOnly = true)
    public List<LocationDto> getAllChildren(UUID parentId) {
        return locationRepository
                .findByParent_IdOrderByNameAsc(parentId)
                .stream().map(LocationDto::of).toList();
    }

    // ── Management mutations ──────────────────────────────────────────────────

    @Transactional
    public LocationDto setEnabled(UUID id, boolean enabled) {
        Location location = locationRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Location not found: " + id));
        location.setEnabled(enabled);
        return LocationDto.of(locationRepository.save(location));
    }

    @Transactional
    public LocationDto toggle(UUID id) {
        Location location = locationRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Location not found: " + id));
        location.setEnabled(!location.isEnabled());
        return LocationDto.of(locationRepository.save(location));
    }
}
