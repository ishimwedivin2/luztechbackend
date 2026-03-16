package com.luztechnology.product.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.common.service.FileStorageService;
import com.luztechnology.product.entity.Category;
import com.luztechnology.product.entity.Product;
import com.luztechnology.product.entity.ProductImage;
import com.luztechnology.product.entity.ProductStatus;
import com.luztechnology.product.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/products")
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;
    private final FileStorageService fileStorageService;

    @GetMapping
    public ResponseEntity<ApiResponse<List<Product>>> getAllProducts() {
        return ResponseEntity.ok(ApiResponse.success(productService.getAllProducts()));
    }

    @GetMapping("/categories")
    public ResponseEntity<ApiResponse<List<Category>>> getAllCategories() {
        return ResponseEntity.ok(ApiResponse.success(productService.getAllCategories()));
    }

    @GetMapping("/search")
    public ResponseEntity<ApiResponse<List<Product>>> searchProducts(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) UUID categoryId,
            @RequestParam(required = false) java.math.BigDecimal minPrice,
            @RequestParam(required = false) java.math.BigDecimal maxPrice,
            @RequestParam(required = false, defaultValue = "ACTIVE") ProductStatus status) {

        List<Product> products = productService.searchProducts(name, categoryId, minPrice, maxPrice, status);
        return ResponseEntity.ok(ApiResponse.success("Search results retrieved", products));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<Product>> getProductById(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success(productService.getProductById(id)));
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
            @RequestParam("sku") String sku,
            @RequestParam("status") ProductStatus status,
            @RequestParam(value = "categoryId", required = false) UUID categoryId,
            @RequestParam("file") MultipartFile file,
            @RequestParam(value = "altText", defaultValue = "") String altText) {

        String fileName = fileStorageService.storeFile(file, "products");
        String fileUrl = "/uploads/" + fileName;

        Product product = Product.builder()
                .name(name)
                .description(description)
                .price(price)
                .sku(sku)
                .status(status)
                .build();

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
