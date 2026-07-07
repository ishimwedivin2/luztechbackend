package com.luztechnology.location;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.luztechnology.location.entity.Location;
import com.luztechnology.location.entity.LocationType;
import com.luztechnology.location.repository.LocationRepository;
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
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * One-time seeder that loads the Rwanda administrative hierarchy from
 * {@code resources/rwanda-locations.json} into the {@code locations} table.
 * <p>
 * The JSON is a nested object: province → district → sector → cell → [village...].
 * Every node is seeded as {@code enabled = true}; admins/employees toggle nodes
 * afterwards. Runs only when the table is empty, so re-running the app is safe and
 * never overrides toggles an operator has made.
 */
@Component
@RequiredArgsConstructor
public class LocationSeeder implements CommandLineRunner {

    private static final Logger logger = LoggerFactory.getLogger(LocationSeeder.class);

    private final LocationRepository locationRepository;
    private final ObjectMapper objectMapper;

    // Villages are batched into one saveAll to avoid ~13k individual inserts.
    private final List<Location> villageBatch = new ArrayList<>();

    @Override
    @Transactional
    public void run(String... args) throws Exception {
        if (locationRepository.count() > 0) {
            logger.info("Locations already seeded ({} rows) — skipping.", locationRepository.count());
            return;
        }

        Resource resource = new ClassPathResource("rwanda-locations.json");
        if (!resource.exists()) {
            logger.warn("rwanda-locations.json not found on classpath — skipping location seed.");
            return;
        }

        JsonNode root;
        try (InputStream in = resource.getInputStream()) {
            root = objectMapper.readTree(in);
        }

        logger.info("Seeding Rwanda locations from rwanda-locations.json ...");
        Iterator<Map.Entry<String, JsonNode>> provinces = root.fields();
        while (provinces.hasNext()) {
            Map.Entry<String, JsonNode> province = provinces.next();
            Location provinceNode = save(province.getKey(), LocationType.PROVINCE, null);
            seedDistricts(province.getValue(), provinceNode);
        }

        if (!villageBatch.isEmpty()) {
            locationRepository.saveAll(villageBatch);
            villageBatch.clear();
        }
        logger.info("Location seed complete: {} total nodes.", locationRepository.count());
    }

    private void seedDistricts(JsonNode districts, Location parent) {
        Iterator<Map.Entry<String, JsonNode>> it = districts.fields();
        while (it.hasNext()) {
            Map.Entry<String, JsonNode> district = it.next();
            Location districtNode = save(district.getKey(), LocationType.DISTRICT, parent);
            seedSectors(district.getValue(), districtNode);
        }
    }

    private void seedSectors(JsonNode sectors, Location parent) {
        Iterator<Map.Entry<String, JsonNode>> it = sectors.fields();
        while (it.hasNext()) {
            Map.Entry<String, JsonNode> sector = it.next();
            Location sectorNode = save(sector.getKey(), LocationType.SECTOR, parent);
            seedCells(sector.getValue(), sectorNode);
        }
    }

    private void seedCells(JsonNode cells, Location parent) {
        Iterator<Map.Entry<String, JsonNode>> it = cells.fields();
        while (it.hasNext()) {
            Map.Entry<String, JsonNode> cell = it.next();
            Location cellNode = save(cell.getKey(), LocationType.CELL, parent);
            for (JsonNode village : cell.getValue()) {
                villageBatch.add(Location.builder()
                        .name(village.asText())
                        .type(LocationType.VILLAGE)
                        .parent(cellNode)
                        .enabled(true)
                        .build());
            }
        }
    }

    private Location save(String name, LocationType type, Location parent) {
        return locationRepository.save(Location.builder()
                .name(name)
                .type(type)
                .parent(parent)
                .enabled(true)
                .build());
    }
}
