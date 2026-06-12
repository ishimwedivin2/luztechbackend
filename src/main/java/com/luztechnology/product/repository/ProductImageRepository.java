package com.luztechnology.product.repository;

import com.luztechnology.product.entity.ProductImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface ProductImageRepository extends JpaRepository<ProductImage, UUID> {
    Optional<ProductImage> findByIdAndProductId(UUID id, UUID productId);
}
