package com.luztechnology.location.entity;

/**
 * The five administrative levels of a Rwandan address, ordered from broadest to
 * narrowest. The ordinal order is relied upon to compute a node's child level.
 */
public enum LocationType {
    PROVINCE,
    DISTRICT,
    SECTOR,
    CELL,
    VILLAGE;

    /** The level directly beneath this one, or {@code null} for {@link #VILLAGE}. */
    public LocationType child() {
        LocationType[] values = values();
        return ordinal() + 1 < values.length ? values[ordinal() + 1] : null;
    }
}
