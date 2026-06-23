package com.luztechnology.product.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.product.entity.Category;
import com.luztechnology.product.repository.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@RestController
@RequestMapping("/api/categories")
@RequiredArgsConstructor
public class CategoryController {

    private final CategoryRepository categoryRepository;

    @GetMapping
    public ResponseEntity<ApiResponse<List<Category>>> getAll() {
        return ResponseEntity.ok(ApiResponse.success(categoryRepository.findAll()));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<Category>> getOne(@PathVariable UUID id) {
        return categoryRepository.findById(id)
                .map(c -> ResponseEntity.ok(ApiResponse.success(c)))
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<Category>> create(@RequestBody Map<String, String> body) {
        String name = body.get("name");
        if (name == null || name.isBlank()) {
            return ResponseEntity.badRequest().body(ApiResponse.error("Category name is required"));
        }
        if (categoryRepository.findByName(name.trim()).isPresent()) {
            return ResponseEntity.badRequest().body(ApiResponse.error("Category already exists"));
        }
        Category cat = Category.builder()
                .name(name.trim())
                .description(body.getOrDefault("description", ""))
                .build();
        return ResponseEntity.ok(ApiResponse.success("Category created", categoryRepository.save(cat)));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Void>> delete(@PathVariable UUID id) {
        categoryRepository.deleteById(id);
        return ResponseEntity.ok(ApiResponse.success("Category deleted", null));
    }
}
