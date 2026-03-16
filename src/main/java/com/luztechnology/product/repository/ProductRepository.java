package com.luztechnology.product.repository;

import com.luztechnology.product.entity.Product;
import com.luztechnology.product.entity.ProductStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface ProductRepository extends JpaRepository<Product, UUID>, JpaSpecificationExecutor<Product> {
    Optional<Product> findBySku(String sku);

    List<Product> findByCategoryId(UUID categoryId);

    List<Product> findByStatus(ProductStatus status);
}
