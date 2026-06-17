package com.luztechnology.user.service;

import com.luztechnology.product.entity.Product;
import com.luztechnology.product.entity.ProductStatus;
import com.luztechnology.product.repository.ProductRepository;
import com.luztechnology.order.entity.OrderItem;
import com.luztechnology.order.repository.OrderRepository;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.entity.WishlistItem;
import com.luztechnology.user.repository.WishlistItemRepository;
import com.luztechnology.common.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Comparator;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class WishlistService {

    private final WishlistItemRepository wishlistRepository;
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;

    public List<WishlistItem> getWishlist(User user) {
        return wishlistRepository.findByUser(user);
    }

    @Transactional
    public WishlistItem addToWishlist(User user, UUID productId) {
        if (wishlistRepository.existsByUserAndProductId(user, productId)) {
            return null; // Already exists
        }

        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new ResourceNotFoundException("Product not found"));

        WishlistItem item = WishlistItem.builder()
                .user(user)
                .product(product)
                .build();

        return wishlistRepository.save(item);
    }

    @Transactional
    public void removeFromWishlist(User user, UUID productId) {
        wishlistRepository.deleteByUserAndProductId(user, productId);
    }

    public boolean isInWishlist(User user, UUID productId) {
        return wishlistRepository.existsByUserAndProductId(user, productId);
    }

    @Transactional(readOnly = true)
    public List<Product> getRecommendations(User user, int limit) {
        List<WishlistItem> wishlist = wishlistRepository.findByUser(user);
        Set<UUID> excludedProductIds = wishlist.stream()
                .map(item -> item.getProduct().getId())
                .collect(Collectors.toSet());

        Set<UUID> preferredCategoryIds = wishlist.stream()
                .map(WishlistItem::getProduct)
                .filter(product -> product.getCategory() != null)
                .map(product -> product.getCategory().getId())
                .collect(Collectors.toSet());

        orderRepository.findByCustomerId(user.getId()).stream()
                .flatMap(order -> order.getOrderItems().stream())
                .map(OrderItem::getProduct)
                .forEach(product -> {
                    excludedProductIds.add(product.getId());
                    if (product.getCategory() != null) {
                        preferredCategoryIds.add(product.getCategory().getId());
                    }
                });

        List<Product> activeProducts = productRepository.findByStatus(ProductStatus.ACTIVE).stream()
                .filter(product -> !excludedProductIds.contains(product.getId()))
                .toList();

        List<Product> categoryMatches = activeProducts.stream()
                .filter(product -> product.getCategory() != null
                        && preferredCategoryIds.contains(product.getCategory().getId()))
                .sorted(Comparator.comparing(Product::getAverageRating,
                        Comparator.nullsLast(Comparator.reverseOrder())))
                .limit(limit)
                .toList();

        if (categoryMatches.size() >= limit) {
            return categoryMatches;
        }

        List<Product> fallback = activeProducts.stream()
                .filter(product -> categoryMatches.stream().noneMatch(match -> match.getId().equals(product.getId())))
                .sorted(Comparator.comparing(Product::getAverageRating,
                        Comparator.nullsLast(Comparator.reverseOrder())))
                .limit(limit - categoryMatches.size())
                .toList();

        java.util.ArrayList<Product> recommendations = new java.util.ArrayList<>(categoryMatches);
        recommendations.addAll(fallback);
        return recommendations;
    }
}
