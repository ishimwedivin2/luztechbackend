package com.luztechnology.product.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.product.entity.Product;
import com.luztechnology.product.entity.ProductReview;
import com.luztechnology.product.repository.ProductRepository;
import com.luztechnology.product.repository.ProductReviewRepository;
import com.luztechnology.product.service.ProductReviewService;
import com.luztechnology.security.services.UserDetailsImpl;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/reviews")
@RequiredArgsConstructor
public class ProductReviewController {

    private final ProductReviewService reviewService;
    private final ProductRepository productRepository;
    private final ProductReviewRepository reviewRepository;
    private final UserRepository userRepository;

    private User getCurrentUser() {
        UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        return userRepository.findById(userDetails.getId()).orElseThrow();
    }

    @GetMapping("/product/{productId}")
    public ResponseEntity<ApiResponse<List<ProductReview>>> getProductReviews(@PathVariable UUID productId) {
        return ResponseEntity.ok(ApiResponse.success(reviewRepository.findByProductId(productId)));
    }

    @PostMapping("/product/{productId}")
    public ResponseEntity<ApiResponse<ProductReview>> addReview(
            @PathVariable UUID productId,
            @RequestBody ReviewRequest request) {
        
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));
        
        ProductReview review = reviewService.addReview(
                product, 
                getCurrentUser(), 
                request.getRating(), 
                request.getComment()
        );
        
        return ResponseEntity.ok(ApiResponse.success("Review submitted", review));
    }

    @Data
    public static class ReviewRequest {
        private Integer rating;
        private String comment;
    }
}
