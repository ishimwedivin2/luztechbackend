package com.luztechnology.inventory.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@Table(name = "suppliers")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Supplier extends BaseEntity {

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String contactEmail;

    private String contactPhone;

    private String address;

    @Builder.Default
    private boolean active = true;

    private Double performanceRating; // 1.0 to 5.0

    @Column(columnDefinition = "TEXT")
    private String notes;
}
