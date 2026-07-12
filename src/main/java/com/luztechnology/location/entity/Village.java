package com.luztechnology.location.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "villages", indexes = {
        @Index(name = "idx_village_cell", columnList = "cell_id"),
        @Index(name = "idx_village_name", columnList = "name")
}, uniqueConstraints = {
        @UniqueConstraint(name = "uk_village_cell_name", columnNames = {"cell_id", "name"})
})
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Village extends LocationBaseEntity {

    @Column(nullable = false)
    private String name;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "cell_id", nullable = false)
    @JsonIgnore
    private Cell cell;

    @Column(nullable = false)
    @Builder.Default
    private boolean enabled = true;
}
