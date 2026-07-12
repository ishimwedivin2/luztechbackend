package com.luztechnology.location.dto;

import com.luztechnology.location.entity.LocationType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

/** Flat projection returned to the frontend dropdowns, independent of the backing table. */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LocationDto {
    private UUID id;
    private String name;
    private LocationType type;
    private boolean enabled;
    /** false for VILLAGE (leaf); lets the management UI know whether to allow drilling down. */
    private boolean hasChildren;

    public static LocationDto of(UUID id, String name, LocationType type, boolean enabled) {
        return LocationDto.builder()
                .id(id)
                .name(name)
                .type(type)
                .enabled(enabled)
                .hasChildren(type != LocationType.VILLAGE)
                .build();
    }
}
