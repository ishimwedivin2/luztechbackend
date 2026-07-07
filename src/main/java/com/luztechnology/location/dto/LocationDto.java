package com.luztechnology.location.dto;

import com.luztechnology.location.entity.Location;
import com.luztechnology.location.entity.LocationType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

/** Flat projection of a {@link Location} node returned to the frontend dropdowns. */
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

    public static LocationDto of(Location location) {
        return LocationDto.builder()
                .id(location.getId())
                .name(location.getName())
                .type(location.getType())
                .enabled(location.isEnabled())
                .hasChildren(location.getType() != LocationType.VILLAGE)
                .build();
    }
}
