package com.luztechnology.location.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "cells", indexes = {
        @Index(name = "idx_cell_sector", columnList = "sector_id"),
        @Index(name = "idx_cell_name", columnList = "name")
}, uniqueConstraints = {
        @UniqueConstraint(name = "uk_cell_sector_name", columnNames = {"sector_id", "name"})
})
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Cell extends LocationBaseEntity {

    @Column(nullable = false)
    private String name;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "sector_id", nullable = false)
    @JsonIgnore
    private Sector sector;

    @Column(nullable = false)
    @Builder.Default
    private boolean enabled = true;
}
