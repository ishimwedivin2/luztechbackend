package com.luztechnology.product.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.product.entity.Category;
import com.luztechnology.product.entity.Discount;
import com.luztechnology.product.entity.Product;
import com.luztechnology.product.entity.ProductStatus;
import com.luztechnology.product.repository.CategoryRepository;
import com.luztechnology.product.repository.DiscountRepository;
import com.luztechnology.product.repository.ProductRepository;
import com.luztechnology.product.entity.ProductImage;
import com.luztechnology.product.repository.ProductImageRepository;
import com.luztechnology.common.service.FileStorageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private final DiscountRepository discountRepository;
    private final ProductImageRepository productImageRepository;
    private final FileStorageService fileStorageService;

    @Transactional(readOnly = true)
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    @Transactional(readOnly = true)
    public java.util.List<com.luztechnology.product.dto.ProductResponse> getAllProductsDto() {
        return productRepository.findAll().stream().map(this::toDto).toList();
    }

    private com.luztechnology.product.dto.ProductResponse toDto(Product p) {
        java.util.List<com.luztechnology.product.dto.ProductImageResponse> images = p.getImages() == null
                ? java.util.List.of()
                : p.getImages().stream().map(this::toImageDto).toList();
        return com.luztechnology.product.dto.ProductResponse.builder()
                .id(p.getId())
                .name(p.getName())
                .description(p.getDescription())
                .price(p.getPrice())
                .sku(p.getSku())
                .status(p.getStatus())
                .categoryId(p.getCategory() == null ? null : p.getCategory().getId())
                .categoryName(p.getCategory() == null ? null : p.getCategory().getName())
                .images(images)
                .build();
    }

    private com.luztechnology.product.dto.ProductImageResponse toImageDto(ProductImage image) {
        return com.luztechnology.product.dto.ProductImageResponse.builder()
                .id(image.getId())
                .url(image.getUrl())
                .altText(image.getAltText())
                .isPrimary(image.isPrimary())
                .build();
    }

    @Transactional(readOnly = true)
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    @Transactional(readOnly = true)
    public List<Product> searchProducts(String name, UUID categoryId, java.math.BigDecimal minPrice,
            java.math.BigDecimal maxPrice, ProductStatus status) {
        org.springframework.data.jpa.domain.Specification<Product> spec = org.springframework.data.jpa.domain.Specification
                .where(
                        com.luztechnology.product.specification.ProductSpecification.hasName(name))
                .and(com.luztechnology.product.specification.ProductSpecification.hasCategory(categoryId))
                .and(com.luztechnology.product.specification.ProductSpecification.hasStatus(status))
                .and(com.luztechnology.product.specification.ProductSpecification.priceBetween(minPrice, maxPrice));

        return productRepository.findAll(spec);
    }

    @Transactional(readOnly = true)
    public Product getProductById(UUID id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product not found with id: " + id));
    }

    @Transactional
    public Product createProduct(Product product) {
        return productRepository.save(product);
    }

    @Transactional
    public Product createProductWithImage(Product product, String imageUrl, String altText) {
        Product savedProduct = productRepository.save(product);

        ProductImage image = ProductImage.builder()
                .product(savedProduct)
                .url(imageUrl)
                .altText(altText)
                .isPrimary(true)
                .build();

        productImageRepository.save(image);
        savedProduct.getImages().add(image);

        return savedProduct;
    }

    @Transactional
    public Product updateProductStatus(UUID id, ProductStatus status) {
        Product product = getProductById(id);
        product.setStatus(status);
        return productRepository.save(product);
    }

    @Transactional
    public Product assignCategory(UUID productId, UUID categoryId) {
        Product product = getProductById(productId);
        Category category = categoryRepository.findById(categoryId)
                .orElseThrow(() -> new ResourceNotFoundException("Category not found"));
        product.setCategory(category);
        return productRepository.save(product);
    }

    @Transactional
    public Product applyDiscount(UUID productId, UUID discountId) {
        Product product = getProductById(productId);
        Discount discount = discountRepository.findById(discountId)
                .orElseThrow(() -> new ResourceNotFoundException("Discount not found"));
        product.setDiscount(discount);
        return productRepository.save(product);
    }

    @Transactional
    public Product updateProduct(UUID id, Product details) {
        Product product = getProductById(id);
        product.setName(details.getName());
        product.setDescription(details.getDescription());
        product.setPrice(details.getPrice());
        product.setSku(details.getSku());
        product.setStatus(details.getStatus());
        return productRepository.save(product);
    }

    @Transactional
    public ProductImage addImageToProduct(UUID productId, String imageUrl, String altText, boolean isPrimary) {
        Product product = getProductById(productId);

        if (isPrimary) {
            // Reset other images' primary status
            product.getImages().forEach(img -> img.setPrimary(false));
        }

        ProductImage image = ProductImage.builder()
                .product(product)
                .url(imageUrl)
                .altText(altText)
                .isPrimary(isPrimary)
                .build();

        return productImageRepository.save(image);
    }

    @Transactional
    public Product removeImageFromProduct(UUID productId, UUID imageId) {
        Product product = getProductById(productId);
        ProductImage image = productImageRepository.findByIdAndProductId(imageId, productId)
                .orElseThrow(() -> new ResourceNotFoundException("Image not found for this product"));

        boolean wasPrimary = image.isPrimary();
        fileStorageService.deleteFile(image.getUrl());
        product.getImages().remove(image);
        productImageRepository.delete(image);

        if (wasPrimary) {
            product.getImages().stream().findFirst().ifPresent(next -> {
                next.setPrimary(true);
                productImageRepository.save(next);
            });
        }

        return product;
    }

    @Transactional
    public void deleteProduct(UUID id) {
        Product product = getProductById(id);
        productRepository.delete(product);
    }
}
