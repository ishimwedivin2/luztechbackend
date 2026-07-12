package com.luztechnology.location.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "sectors", indexes = {
        @Index(name = "idx_sector_district", columnList = "district_id"),
        @Index(name = "idx_sector_name", columnList = "name")
}, uniqueConstraints = {
        @UniqueConstraint(name = "uk_sector_district_name", columnNames = {"district_id", "name"})
})
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Sector extends LocationBaseEntity {

    @Column(nullable = false)
    private String name;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "district_id", nullable = false)
    @JsonIgnore
    private District district;

    @Column(nullable = false)
    @Builder.Default
    private boolean enabled = true;
}
