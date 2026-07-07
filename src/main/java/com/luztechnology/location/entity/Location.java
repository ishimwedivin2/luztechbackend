package com.luztechnology.location.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

/**
 * A single node in the Rwanda location hierarchy (province → district → sector →
 * cell → village), stored as a self-referencing adjacency tree. {@code parent} is
 * {@code null} for provinces. A node with {@code enabled = false} is hidden from
 * customers during checkout; disabling a node effectively removes its whole subtree
 * from shipping, because children are only ever reached through an enabled parent.
 */
@Entity
@Table(name = "locations", indexes = {
        @Index(name = "idx_location_parent", columnList = "parent_id"),
        @Index(name = "idx_location_type", columnList = "type")
})
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Location extends BaseEntity {

    @Column(nullable = false)
    private String name;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private LocationType type;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parent_id")
    @JsonIgnore
    private Location parent;

    @Column(nullable = false)
    @Builder.Default
    private boolean enabled = true;
}
