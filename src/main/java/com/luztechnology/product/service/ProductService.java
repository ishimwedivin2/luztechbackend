package com.luztechnology.product.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.common.service.FileStorageService;
import com.luztechnology.finance.entity.TaxRate;
import com.luztechnology.finance.repository.TaxRateRepository;
import com.luztechnology.finance.service.TaxRateService;
import com.luztechnology.inventory.entity.InventoryItem;
import com.luztechnology.inventory.repository.InventoryItemRepository;
import com.luztechnology.product.entity.Category;
import com.luztechnology.product.entity.Discount;
import com.luztechnology.product.entity.Product;
import com.luztechnology.product.entity.ProductImage;
import com.luztechnology.product.entity.ProductStatus;
import com.luztechnology.product.repository.CategoryRepository;
import com.luztechnology.product.repository.DiscountRepository;
import com.luztechnology.product.repository.ProductImageRepository;
import com.luztechnology.product.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
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
    private final TaxRateRepository taxRateRepository;
    private final ProductImageRepository productImageRepository;
    private final FileStorageService fileStorageService;
    private final InventoryItemRepository inventoryItemRepository;
    private final com.luztechnology.product.repository.ProductReviewRepository productReviewRepository;
    private final ProductPricingService productPricingService;
    private final TaxRateService taxRateService;

    @Transactional(readOnly = true)
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    @Transactional(readOnly = true)
    public java.util.List<com.luztechnology.product.dto.ProductResponse> getAllProductsDto() {
        return productRepository.findAll().stream().map(this::toDto).toList();
    }

    public com.luztechnology.product.dto.ProductResponse toDto(Product p) {
        java.util.List<com.luztechnology.product.dto.ProductImageResponse> images = p.getImages() == null
                ? java.util.List.of()
                : p.getImages().stream().map(this::toImageDto).toList();
        long reviewsCount = productReviewRepository.countByProductId(p.getId());
        Double averageRating = productReviewRepository.findAverageRatingByProductId(p.getId());
        java.math.BigDecimal originalPrice = productPricingService.originalUnitPrice(p);
        java.math.BigDecimal discountedPrice = productPricingService.effectiveUnitPrice(p);
        java.math.BigDecimal discountAmount = productPricingService.unitDiscountAmount(p);
        java.math.BigDecimal activeDiscountPercentage = productPricingService.activeDiscountPercentage(p);
        java.math.BigDecimal taxRate = productPricingService.taxRate(p);
        java.math.BigDecimal taxAmount = productPricingService.effectiveUnitTaxAmount(p);
        java.math.BigDecimal costPrice = productPricingService.costPrice(p);
        java.math.BigDecimal profitPerUnit = productPricingService.profitPerUnit(p);
        java.math.BigDecimal profitMarginPercent = productPricingService.profitMarginPercent(p);
        return com.luztechnology.product.dto.ProductResponse.builder()
                .id(p.getId())
                .name(p.getName())
                .description(p.getDescription())
                .price(p.getPrice())
                .costPrice(costPrice)
                .profitPerUnit(profitPerUnit)
                .profitMarginPercent(profitMarginPercent)
                .originalPrice(originalPrice)
                .discountedPrice(discountedPrice)
                .discountAmount(discountAmount)
                .priceIncludingTax(productPricingService.originalUnitPriceIncludingTax(p))
                .discountedPriceIncludingTax(productPricingService.effectiveUnitPriceIncludingTax(p))
                .taxAmount(taxAmount)
                .taxRate(taxRate)
                .taxRateId(p.getTaxRate() == null ? null : p.getTaxRate().getId())
                .taxName(p.getTaxRate() == null ? null : p.getTaxRate().getName())
                .taxCode(p.getTaxRate() == null ? null : p.getTaxRate().getCode())
                .taxIncluded(taxRate.compareTo(java.math.BigDecimal.ZERO) > 0)
                .sku(p.getSku())
                .status(p.getStatus())
                .categoryId(p.getCategory() == null ? null : p.getCategory().getId())
                .categoryName(p.getCategory() == null ? null : p.getCategory().getName())
                .images(images)
                .featured(p.isFeatured())
                .discountPercentage(activeDiscountPercentage)
                .discountName(productPricingService.activeDiscountName(p))
                .reviewsCount(reviewsCount)
                .averageRating(averageRating)
                .build();
    }

    private void ensureInventoryItem(Product product) {
        if (product.getSku() == null) return;
        InventoryItem item = inventoryItemRepository.findBySku(product.getSku())
                .orElseGet(() -> {
                    try {
                        return inventoryItemRepository.save(InventoryItem.builder()
                                .sku(product.getSku())
                                .productName(product.getName())
                                .quantity(0)
                                .lowStockThreshold(5)
                                .location("Main Warehouse")
                                .unitCost(product.getCostPrice())
                                .build());
                    } catch (DataIntegrityViolationException e) {
                        return inventoryItemRepository.findBySku(product.getSku()).orElseThrow();
                    }
                });
        if (product.getInventoryItem() == null || !product.getInventoryItem().getId().equals(item.getId())) {
            product.setInventoryItem(item);
            productRepository.save(product);
        }
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
        Specification<Product> spec = buildSearchSpec(name, categoryId, minPrice, maxPrice, status);
        return productRepository.findAll(spec);
    }

    @Transactional(readOnly = true)
    public Page<com.luztechnology.product.dto.ProductResponse> searchProductsPaged(
            String name, UUID categoryId, java.math.BigDecimal minPrice,
            java.math.BigDecimal maxPrice, ProductStatus status, Pageable pageable) {
        Specification<Product> spec = buildSearchSpec(name, categoryId, minPrice, maxPrice, status);
        Page<Product> page = productRepository.findAll(spec, pageable);
        List<com.luztechnology.product.dto.ProductResponse> dtos = page.getContent().stream().map(this::toDto).toList();
        return new PageImpl<>(dtos, pageable, page.getTotalElements());
    }

    private Specification<Product> buildSearchSpec(String name, UUID categoryId,
            java.math.BigDecimal minPrice, java.math.BigDecimal maxPrice, ProductStatus status) {
        return Specification
                .where(com.luztechnology.product.specification.ProductSpecification.hasName(name))
                .and(com.luztechnology.product.specification.ProductSpecification.hasCategory(categoryId))
                .and(com.luztechnology.product.specification.ProductSpecification.hasStatus(status))
                .and(com.luztechnology.product.specification.ProductSpecification.priceBetween(minPrice, maxPrice));
    }

    @Transactional(readOnly = true)
    public List<com.luztechnology.product.dto.ProductResponse> getFeaturedProducts() {
        return productRepository.findByFeaturedTrueAndStatus(ProductStatus.ACTIVE).stream().map(this::toDto).toList();
    }

    @Transactional
    public Product setFeatured(UUID id, boolean featured) {
        Product product = getProductById(id);
        product.setFeatured(featured);
        return productRepository.save(product);
    }

    @Transactional(readOnly = true)
    public Product getProductById(UUID id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Product not found with id: " + id));
    }

    @Transactional
    public Product createProduct(Product product) {
        ensureTaxRate(product);
        Product saved = productRepository.save(product);
        ensureInventoryItem(saved);
        return saved;
    }

    @Transactional
    public Product createProductWithImage(Product product, String imageUrl, String altText) {
        ensureTaxRate(product);
        Product savedProduct = productRepository.save(product);

        ProductImage image = ProductImage.builder()
                .product(savedProduct)
                .url(imageUrl)
                .altText(altText)
                .isPrimary(true)
                .build();

        productImageRepository.save(image);
        savedProduct.getImages().add(image);
        ensureInventoryItem(savedProduct);

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
    public Product removeDiscount(UUID productId) {
        Product product = getProductById(productId);
        product.setDiscount(null);
        return productRepository.save(product);
    }

    @Transactional
    public Product updateProduct(UUID id, Product details) {
        Product product = getProductById(id);
        product.setName(details.getName());
        product.setDescription(details.getDescription());
        product.setPrice(details.getPrice());
        if (details.getCostPrice() != null) {
            product.setCostPrice(details.getCostPrice());
        }
        product.setSku(details.getSku());
        product.setStatus(details.getStatus());
        product.setFeatured(details.isFeatured());
        if (details.getTaxRate() != null && details.getTaxRate().getId() != null) {
            taxRateRepository.findById(details.getTaxRate().getId()).ifPresent(product::setTaxRate);
        } else if (details.getTaxRate() == null) {
            product.setTaxRate(null);
        }
        if (details.getCategory() != null && details.getCategory().getId() != null) {
            categoryRepository.findById(details.getCategory().getId())
                    .ifPresent(product::setCategory);
        }
        Product saved = productRepository.save(product);
        if (saved.getInventoryItem() != null) {
            InventoryItem inv = inventoryItemRepository.findById(saved.getInventoryItem().getId()).orElse(null);
            if (inv != null) {
                if (details.getStock() != null) {
                    inv.setQuantity(details.getStock());
                }
                if (details.getCostPrice() != null) {
                    inv.setUnitCost(details.getCostPrice());
                }
                inventoryItemRepository.save(inv);
            }
        }
        return saved;
    }

    private void ensureTaxRate(Product product) {
        if (product.getTaxRate() != null && product.getTaxRate().getId() != null) {
            TaxRate managed = taxRateRepository.findById(product.getTaxRate().getId()).orElse(null);
            product.setTaxRate(managed);
            return;
        }
        if (product.getTaxRate() == null) {
            product.setTaxRate(taxRateService.getDefaultTaxRate());
        }
    }

    @Transactional
    public ProductImage addImageToProduct(UUID productId, String imageUrl, String altText, boolean isPrimary) {
        Product product = getProductById(productId);

        if (isPrimary) {
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
        try {
            productRepository.delete(product);
            productRepository.flush();
        } catch (DataIntegrityViolationException e) {
            throw new IllegalStateException(
                "Cannot delete this product because it has already been added to a cart or purchased by a customer.");
        }
    }
}
