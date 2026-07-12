package com.luztechnology.location.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "districts", indexes = {
        @Index(name = "idx_district_province", columnList = "province_id"),
        @Index(name = "idx_district_name", columnList = "name")
}, uniqueConstraints = {
        @UniqueConstraint(name = "uk_district_province_name", columnNames = {"province_id", "name"})
})
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class District extends LocationBaseEntity {

    @Column(nullable = false)
    private String name;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "province_id", nullable = false)
    @JsonIgnore
    private Province province;

    @Column(nullable = false)
    @Builder.Default
    private boolean enabled = true;
}
