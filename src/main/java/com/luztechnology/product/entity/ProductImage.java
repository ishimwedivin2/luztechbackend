package com.luztechnology.product.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

@Entity
@Table(name = "product_images")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductImage extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", nullable = false)
    @JsonIgnore
    private Product product;

    @Column(nullable = false)
    private String url;

    @Column(nullable = false)
    private String altText;

    @Builder.Default
    private boolean isPrimary = false;
}
