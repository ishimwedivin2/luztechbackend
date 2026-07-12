package com.luztechnology.location;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.luztechnology.location.entity.Cell;
import com.luztechnology.location.entity.District;
import com.luztechnology.location.entity.Province;
import com.luztechnology.location.entity.Sector;
import com.luztechnology.location.entity.Village;
import com.luztechnology.location.repository.CellRepository;
import com.luztechnology.location.repository.DistrictRepository;
import com.luztechnology.location.repository.ProvinceRepository;
import com.luztechnology.location.repository.SectorRepository;
import com.luztechnology.location.repository.VillageRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Seeds Rwanda administrative data from {@code resources/rwanda-locations.json}
 * into normalized tables: provinces, districts, sectors, cells and villages.
 *
 * The JSON is a nested object: province -> district -> sector -> cell -> villages.
 * Every row starts enabled. The seeder runs only when the province table is empty,
 * so it will not overwrite admin/employee enable/disable decisions on restart.
 */
@Component
@RequiredArgsConstructor
public class LocationSeeder implements CommandLineRunner {

    private static final Logger logger = LoggerFactory.getLogger(LocationSeeder.class);

    private final ProvinceRepository provinceRepository;
    private final DistrictRepository districtRepository;
    private final SectorRepository sectorRepository;
    private final CellRepository cellRepository;
    private final VillageRepository villageRepository;
    private final ObjectMapper objectMapper;

    private final List<Village> villageBatch = new ArrayList<>();

    @Override
    @Transactional
    public void run(String... args) throws Exception {
        if (provinceRepository.count() > 0) {
            logger.info("Locations already seeded ({} provinces) - skipping.", provinceRepository.count());
            return;
        }

        Resource resource = new ClassPathResource("rwanda-locations.json");
        if (!resource.exists()) {
            logger.warn("rwanda-locations.json not found on classpath - skipping location seed.");
            return;
        }

        JsonNode root;
        try (InputStream in = resource.getInputStream()) {
            root = objectMapper.readTree(in);
        }

        logger.info("Seeding Rwanda locations from rwanda-locations.json into normalized tables ...");
        Iterator<Map.Entry<String, JsonNode>> provinces = root.fields();
        while (provinces.hasNext()) {
            Map.Entry<String, JsonNode> province = provinces.next();
            Province provinceNode = saveProvince(province.getKey());
            seedDistricts(province.getValue(), provinceNode);
        }

        flushVillages();

        long total = provinceRepository.count()
                + districtRepository.count()
                + sectorRepository.count()
                + cellRepository.count()
                + villageRepository.count();
        logger.info("Location seed complete: {} total nodes across normalized tables.", total);
    }

    private void seedDistricts(JsonNode districts, Province parent) {
        Iterator<Map.Entry<String, JsonNode>> it = districts.fields();
        while (it.hasNext()) {
            Map.Entry<String, JsonNode> district = it.next();
            District districtNode = saveDistrict(district.getKey(), parent);
            seedSectors(district.getValue(), districtNode);
        }
    }

    private void seedSectors(JsonNode sectors, District parent) {
        Iterator<Map.Entry<String, JsonNode>> it = sectors.fields();
        while (it.hasNext()) {
            Map.Entry<String, JsonNode> sector = it.next();
            Sector sectorNode = saveSector(sector.getKey(), parent);
            seedCells(sector.getValue(), sectorNode);
        }
    }

    private void seedCells(JsonNode cells, Sector parent) {
        Iterator<Map.Entry<String, JsonNode>> it = cells.fields();
        while (it.hasNext()) {
            Map.Entry<String, JsonNode> cell = it.next();
            Cell cellNode = saveCell(cell.getKey(), parent);
            Set<String> villageNamesInCell = new HashSet<>();
            for (JsonNode village : cell.getValue()) {
                String villageName = clean(village.asText());
                if (villageName == null || !villageNamesInCell.add(villageName.toLowerCase())) {
                    continue;
                }
                villageBatch.add(Village.builder()
                        .name(villageName)
                        .cell(cellNode)
                        .enabled(true)
                        .build());
                if (villageBatch.size() >= 1000) {
                    flushVillages();
                }
            }
        }
    }

    private String clean(String value) {
        if (value == null) return null;
        String trimmed = value.trim();
        return trimmed.isEmpty() ? null : trimmed;
    }

    private Province saveProvince(String name) {
        return provinceRepository.save(Province.builder()
                .name(name)
                .enabled(true)
                .build());
    }

    private District saveDistrict(String name, Province province) {
        return districtRepository.save(District.builder()
                .name(name)
                .province(province)
                .enabled(true)
                .build());
    }

    private Sector saveSector(String name, District district) {
        return sectorRepository.save(Sector.builder()
                .name(name)
                .district(district)
                .enabled(true)
                .build());
    }

    private Cell saveCell(String name, Sector sector) {
        return cellRepository.save(Cell.builder()
                .name(name)
                .sector(sector)
                .enabled(true)
                .build());
    }

    private void flushVillages() {
        if (!villageBatch.isEmpty()) {
            villageRepository.saveAll(villageBatch);
            villageBatch.clear();
        }
    }
}
