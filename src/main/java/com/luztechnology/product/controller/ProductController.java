package com.luztechnology.product.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.common.service.FileStorageService;
import com.luztechnology.product.entity.Category;
import com.luztechnology.product.entity.Product;
import com.luztechnology.product.entity.ProductImage;
import com.luztechnology.product.entity.ProductStatus;
import com.luztechnology.finance.entity.TaxRate;
import com.luztechnology.product.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/products")
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;
    private final FileStorageService fileStorageService;

    @GetMapping
    public ResponseEntity<ApiResponse<java.util.List<com.luztechnology.product.dto.ProductResponse>>> getAllProducts() {
        return ResponseEntity.ok(ApiResponse.success(productService.getAllProductsDto()));
    }

    @GetMapping("/_test")
    public ResponseEntity<ApiResponse<String>> testEndpoint() {
        return ResponseEntity.ok(ApiResponse.success("ok"));
    }

    @GetMapping("/categories")
    public ResponseEntity<ApiResponse<List<Category>>> getAllCategories() {
        return ResponseEntity.ok(ApiResponse.success(productService.getAllCategories()));
    }

    @GetMapping("/featured")
    public ResponseEntity<ApiResponse<List<com.luztechnology.product.dto.ProductResponse>>> getFeaturedProducts() {
        return ResponseEntity.ok(ApiResponse.success(productService.getFeaturedProducts()));
    }

    @GetMapping("/search")
    public ResponseEntity<ApiResponse<Page<com.luztechnology.product.dto.ProductResponse>>> searchProducts(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) UUID categoryId,
            @RequestParam(required = false) java.math.BigDecimal minPrice,
            @RequestParam(required = false) java.math.BigDecimal maxPrice,
            @RequestParam(required = false) ProductStatus status,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestParam(defaultValue = "createdAt") String sortBy,
            @RequestParam(defaultValue = "desc") String sortDir) {

        Sort sort = sortDir.equalsIgnoreCase("asc") ? Sort.by(sortBy).ascending() : Sort.by(sortBy).descending();
        Pageable pageable = PageRequest.of(page, size, sort);
        Page<com.luztechnology.product.dto.ProductResponse> result =
                productService.searchProductsPaged(name, categoryId, minPrice, maxPrice, status, pageable);
        return ResponseEntity.ok(ApiResponse.success("Search results retrieved", result));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<com.luztechnology.product.dto.ProductResponse>> getProductById(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success(productService.toDto(productService.getProductById(id))));
    }


    @PostMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Product>> createProduct(@RequestBody Product product) {
        return ResponseEntity.ok(ApiResponse.success("Product created", productService.createProduct(product)));
    }

    @PostMapping("/upload")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Product>> createProductWithImage(
            @RequestParam("name") String name,
            @RequestParam("description") String description,
            @RequestParam("price") java.math.BigDecimal price,
            @RequestParam(value = "costPrice", required = false) java.math.BigDecimal costPrice,
            @RequestParam("sku") String sku,
            @RequestParam("status") ProductStatus status,
            @RequestParam(value = "categoryId", required = false) UUID categoryId,
            @RequestParam(value = "taxRateId", required = false) UUID taxRateId,
            @RequestParam("file") MultipartFile file,
            @RequestParam(value = "altText", defaultValue = "") String altText) {

        String fileName = fileStorageService.storeFile(file, "products");
        String fileUrl = "/uploads/" + fileName;

        Product product = Product.builder()
                .name(name)
                .description(description)
                .price(price)
                .costPrice(costPrice != null ? costPrice : java.math.BigDecimal.ZERO)
                .sku(sku)
                .status(status)
                .taxRate(taxRateId == null ? null : TaxRate.builder().build())
                .build();
        if (taxRateId != null) {
            product.getTaxRate().setId(taxRateId);
        }

        Product savedProduct = productService.createProductWithImage(product, fileUrl, altText);

        if (categoryId != null) {
            savedProduct = productService.assignCategory(savedProduct.getId(), categoryId);
        }

        return ResponseEntity.ok(ApiResponse.success("Product created with image", savedProduct));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Product>> updateProduct(@PathVariable UUID id, @RequestBody Product product) {
        return ResponseEntity.ok(ApiResponse.success("Product updated", productService.updateProduct(id, product)));
    }

    @PatchMapping("/{id}/featured")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Product>> setFeatured(@PathVariable UUID id,
            @RequestParam boolean featured) {
        return ResponseEntity.ok(ApiResponse.success("Featured status updated", productService.setFeatured(id, featured)));
    }

    @PatchMapping("/{id}/status")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Product>> updateStatus(@PathVariable UUID id,
            @RequestParam ProductStatus status) {
        return ResponseEntity.ok(ApiResponse.success("Status updated", productService.updateProductStatus(id, status)));
    }

    @PatchMapping("/{id}/category/{categoryId}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Product>> assignCategory(@PathVariable UUID id, @PathVariable UUID categoryId) {
        return ResponseEntity
                .ok(ApiResponse.success("Category assigned", productService.assignCategory(id, categoryId)));
    }

    @PatchMapping("/{id}/discount/{discountId}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Product>> applyDiscount(@PathVariable UUID id, @PathVariable UUID discountId) {
        return ResponseEntity.ok(ApiResponse.success("Discount applied", productService.applyDiscount(id, discountId)));
    }

    @DeleteMapping("/{id}/discount")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Product>> removeDiscount(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Discount removed", productService.removeDiscount(id)));
    }

    @PatchMapping("/{id}/remove-image/{imageId}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Product>> removeProductImage(
            @PathVariable UUID id,
            @PathVariable UUID imageId) {
        return ResponseEntity.ok(ApiResponse.success("Image removed",
                productService.removeImageFromProduct(id, imageId)));
    }

    @PostMapping("/{id}/images")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<ProductImage>> uploadProductImage(
            @PathVariable UUID id,
            @RequestParam("file") MultipartFile file,
            @RequestParam(value = "altText", defaultValue = "") String altText,
            @RequestParam(value = "isPrimary", defaultValue = "false") boolean isPrimary) {

        String fileName = fileStorageService.storeFile(file, "products");
        String fileUrl = "/uploads/" + fileName;

        ProductImage image = productService.addImageToProduct(id, fileUrl, altText, isPrimary);
        return ResponseEntity.ok(ApiResponse.success("Image uploaded successfully", image));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> deleteProduct(@PathVariable UUID id) {
        productService.deleteProduct(id);
        return ResponseEntity.ok(ApiResponse.success("Product deleted successfully", null));
    }
}
