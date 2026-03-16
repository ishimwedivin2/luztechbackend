package com.luztechnology.product.service;

import com.luztechnology.product.entity.Product;
import com.luztechnology.product.entity.ProductReview;
import com.luztechnology.product.repository.ProductRepository;
import com.luztechnology.product.repository.ProductReviewRepository;
import com.luztechnology.user.entity.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ProductReviewService {

    private final ProductReviewRepository reviewRepository;
    private final ProductRepository productRepository;

    @Transactional
    public ProductReview addReview(Product product, User user, Integer rating, String comment) {
        ProductReview review = ProductReview.builder()
                .product(product)
                .user(user)
                .rating(rating)
                .comment(comment)
                .build();

        ProductReview savedReview = reviewRepository.save(review);
        updateProductAverageRating(product.getId());
        return savedReview;
    }

    @Transactional
    public void updateProductAverageRating(UUID productId) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new RuntimeException("Product not found"));

        List<ProductReview> reviews = reviewRepository.findByProductId(productId);

        if (reviews.isEmpty()) {
            product.setAverageRating(BigDecimal.ZERO);
        } else {
            double average = reviews.stream()
                    .mapToInt(ProductReview::getRating)
                    .average()
                    .orElse(0.0);

            product.setAverageRating(BigDecimal.valueOf(average).setScale(2, RoundingMode.HALF_UP));
        }

        productRepository.save(product);
    }
}
