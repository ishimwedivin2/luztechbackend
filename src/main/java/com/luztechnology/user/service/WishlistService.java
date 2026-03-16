package com.luztechnology.user.service;

import com.luztechnology.product.entity.Product;
import com.luztechnology.product.repository.ProductRepository;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.entity.WishlistItem;
import com.luztechnology.user.repository.WishlistItemRepository;
import com.luztechnology.common.exception.ResourceNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class WishlistService {

    private final WishlistItemRepository wishlistRepository;
    private final ProductRepository productRepository;

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
}
