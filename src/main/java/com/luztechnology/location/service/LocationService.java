package com.luztechnology.location.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.location.dto.LocationDto;
import com.luztechnology.location.entity.*;
import com.luztechnology.location.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class LocationService {

    private final ProvinceRepository provinceRepository;
    private final DistrictRepository districtRepository;
    private final SectorRepository sectorRepository;
    private final CellRepository cellRepository;
    private final VillageRepository villageRepository;

    // ── Public (customer) reads — enabled nodes only ──────────────────────────

    @Transactional(readOnly = true)
    public List<LocationDto> getEnabledProvinces() {
        return provinceRepository.findByEnabledTrueOrderByNameAsc().stream()
                .map(this::toDto).toList();
    }

    @Transactional(readOnly = true)
    public List<LocationDto> getEnabledChildren(UUID parentId) {
        Province province = provinceRepository.findById(parentId).orElse(null);
        if (province != null) {
            if (!province.isEnabled()) return List.of();
            return districtRepository.findByProvince_IdAndEnabledTrueOrderByNameAsc(parentId).stream()
                    .map(this::toDto).toList();
        }
        District district = districtRepository.findById(parentId).orElse(null);
        if (district != null) {
            if (!district.isEnabled()) return List.of();
            return sectorRepository.findByDistrict_IdAndEnabledTrueOrderByNameAsc(parentId).stream()
                    .map(this::toDto).toList();
        }
        Sector sector = sectorRepository.findById(parentId).orElse(null);
        if (sector != null) {
            if (!sector.isEnabled()) return List.of();
            return cellRepository.findBySector_IdAndEnabledTrueOrderByNameAsc(parentId).stream()
                    .map(this::toDto).toList();
        }
        Cell cell = cellRepository.findById(parentId).orElse(null);
        if (cell != null) {
            if (!cell.isEnabled()) return List.of();
            return villageRepository.findByCell_IdAndEnabledTrueOrderByNameAsc(parentId).stream()
                    .map(this::toDto).toList();
        }
        throw new ResourceNotFoundException("Location parent not found: " + parentId);
    }

    // ── Management (admin / employee) reads — includes disabled nodes ─────────

    @Transactional(readOnly = true)
    public List<LocationDto> getAllProvinces() {
        return provinceRepository.findByOrderByNameAsc().stream()
                .map(this::toDto).toList();
    }

    @Transactional(readOnly = true)
    public List<LocationDto> getAllChildren(UUID parentId) {
        if (provinceRepository.existsById(parentId)) {
            return districtRepository.findByProvince_IdOrderByNameAsc(parentId).stream()
                    .map(this::toDto).toList();
        }
        if (districtRepository.existsById(parentId)) {
            return sectorRepository.findByDistrict_IdOrderByNameAsc(parentId).stream()
                    .map(this::toDto).toList();
        }
        if (sectorRepository.existsById(parentId)) {
            return cellRepository.findBySector_IdOrderByNameAsc(parentId).stream()
                    .map(this::toDto).toList();
        }
        if (cellRepository.existsById(parentId)) {
            return villageRepository.findByCell_IdOrderByNameAsc(parentId).stream()
                    .map(this::toDto).toList();
        }
        throw new ResourceNotFoundException("Location parent not found: " + parentId);
    }

    // ── Management mutations ──────────────────────────────────────────────────

    @Transactional
    public LocationDto setEnabled(UUID id, boolean enabled) {
        Province province = provinceRepository.findById(id).orElse(null);
        if (province != null) {
            province.setEnabled(enabled);
            return toDto(provinceRepository.save(province));
        }
        District district = districtRepository.findById(id).orElse(null);
        if (district != null) {
            district.setEnabled(enabled);
            return toDto(districtRepository.save(district));
        }
        Sector sector = sectorRepository.findById(id).orElse(null);
        if (sector != null) {
            sector.setEnabled(enabled);
            return toDto(sectorRepository.save(sector));
        }
        Cell cell = cellRepository.findById(id).orElse(null);
        if (cell != null) {
            cell.setEnabled(enabled);
            return toDto(cellRepository.save(cell));
        }
        Village village = villageRepository.findById(id).orElse(null);
        if (village != null) {
            village.setEnabled(enabled);
            return toDto(villageRepository.save(village));
        }
        throw new ResourceNotFoundException("Location not found: " + id);
    }

    // ── Delivery restriction ──────────────────────────────────────────────────

    /**
     * Enforces that orders can only be placed to an enabled province and district.
     * Called during customer checkout. Throws {@link IllegalArgumentException} (mapped
     * to a 400) when the location is unknown or has been disabled by an admin/employee.
     */
    @Transactional(readOnly = true)
    public void assertDeliverable(String province, String district) {
        assertDeliverable(province, district, null, null, null);
    }

    @Transactional(readOnly = true)
    public void assertDeliverable(String province, String district, String sector, String cell, String village) {
        String prov = province == null ? "" : province.trim();
        String dist = district == null ? "" : district.trim();
        if (prov.isEmpty() || dist.isEmpty()) {
            throw new IllegalArgumentException("Delivery province and district are required");
        }

        Province provinceNode = provinceRepository.findFirstByNameIgnoreCase(prov)
                .orElseThrow(() -> new IllegalArgumentException("We do not deliver to province: " + province));
        if (!provinceNode.isEnabled()) {
            throw new IllegalArgumentException("Ordering is currently unavailable for " + provinceNode.getName());
        }

        District districtNode = districtRepository
                .findFirstByProvince_IdAndNameIgnoreCase(provinceNode.getId(), dist)
                .orElseThrow(() -> new IllegalArgumentException(
                        "We do not deliver to district: " + district + ", " + provinceNode.getName()));
        if (!districtNode.isEnabled()) {
            throw new IllegalArgumentException(
                    "Ordering is currently unavailable for " + districtNode.getName() + ", " + provinceNode.getName());
        }

        String sect = sector == null ? "" : sector.trim();
        if (!sect.isEmpty()) {
            Sector sectorNode = sectorRepository.findFirstByDistrict_IdAndNameIgnoreCase(districtNode.getId(), sect)
                    .orElseThrow(() -> new IllegalArgumentException(
                            "We do not deliver to sector: " + sector + ", " + districtNode.getName()));
            if (!sectorNode.isEnabled()) {
                throw new IllegalArgumentException("Ordering is currently unavailable for "
                        + sectorNode.getName() + ", " + districtNode.getName());
            }

            String cellName = cell == null ? "" : cell.trim();
            if (!cellName.isEmpty()) {
                Cell cellNode = cellRepository.findFirstBySector_IdAndNameIgnoreCase(sectorNode.getId(), cellName)
                        .orElseThrow(() -> new IllegalArgumentException(
                                "We do not deliver to cell: " + cell + ", " + sectorNode.getName()));
                if (!cellNode.isEnabled()) {
                    throw new IllegalArgumentException("Ordering is currently unavailable for "
                            + cellNode.getName() + ", " + sectorNode.getName());
                }

                String villageName = village == null ? "" : village.trim();
                if (!villageName.isEmpty()) {
                    Village villageNode = villageRepository.findFirstByCell_IdAndNameIgnoreCase(cellNode.getId(), villageName)
                            .orElseThrow(() -> new IllegalArgumentException(
                                    "We do not deliver to village: " + village + ", " + cellNode.getName()));
                    if (!villageNode.isEnabled()) {
                        throw new IllegalArgumentException("Ordering is currently unavailable for "
                                + villageNode.getName() + ", " + cellNode.getName());
                    }
                }
            }
        }
    }

    @Transactional
    public LocationDto toggle(UUID id) {
        Province province = provinceRepository.findById(id).orElse(null);
        if (province != null) return setEnabled(id, !province.isEnabled());
        District district = districtRepository.findById(id).orElse(null);
        if (district != null) return setEnabled(id, !district.isEnabled());
        Sector sector = sectorRepository.findById(id).orElse(null);
        if (sector != null) return setEnabled(id, !sector.isEnabled());
        Cell cell = cellRepository.findById(id).orElse(null);
        if (cell != null) return setEnabled(id, !cell.isEnabled());
        Village village = villageRepository.findById(id).orElse(null);
        if (village != null) return setEnabled(id, !village.isEnabled());
        throw new ResourceNotFoundException("Location not found: " + id);
    }

    private LocationDto toDto(Province province) {
        return LocationDto.of(province.getId(), province.getName(), LocationType.PROVINCE, province.isEnabled());
    }

    private LocationDto toDto(District district) {
        return LocationDto.of(district.getId(), district.getName(), LocationType.DISTRICT, district.isEnabled());
    }

    private LocationDto toDto(Sector sector) {
        return LocationDto.of(sector.getId(), sector.getName(), LocationType.SECTOR, sector.isEnabled());
    }

    private LocationDto toDto(Cell cell) {
        return LocationDto.of(cell.getId(), cell.getName(), LocationType.CELL, cell.isEnabled());
    }

    private LocationDto toDto(Village village) {
        return LocationDto.of(village.getId(), village.getName(), LocationType.VILLAGE, village.isEnabled());
    }
}
