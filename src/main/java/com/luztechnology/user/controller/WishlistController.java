package com.luztechnology.user.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.product.entity.Product;
import com.luztechnology.security.services.UserDetailsImpl;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.entity.WishlistItem;
import com.luztechnology.user.repository.UserRepository;
import com.luztechnology.user.service.WishlistService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/wishlist")
@RequiredArgsConstructor
public class WishlistController {

    private final WishlistService wishlistService;
    private final UserRepository userRepository;

    private User getCurrentUser() {
        UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        return userRepository.findById(userDetails.getId()).orElseThrow();
    }

    @GetMapping
    public ResponseEntity<ApiResponse<List<WishlistItem>>> getWishlist() {
        return ResponseEntity.ok(ApiResponse.success(wishlistService.getWishlist(getCurrentUser())));
    }

    @PostMapping("/{productId}")
    public ResponseEntity<ApiResponse<WishlistItem>> addToWishlist(@PathVariable UUID productId) {
        WishlistItem item = wishlistService.addToWishlist(getCurrentUser(), productId);
        if (item == null) {
            return ResponseEntity.ok(ApiResponse.success("Product already in wishlist", null));
        }
        return ResponseEntity.ok(ApiResponse.success("Added to wishlist", item));
    }

    @DeleteMapping("/{productId}")
    public ResponseEntity<ApiResponse<Void>> removeFromWishlist(@PathVariable UUID productId) {
        wishlistService.removeFromWishlist(getCurrentUser(), productId);
        return ResponseEntity.ok(ApiResponse.success("Removed from wishlist", null));
    }

    @GetMapping("/check/{productId}")
    public ResponseEntity<ApiResponse<Boolean>> checkWishlist(@PathVariable UUID productId) {
        return ResponseEntity.ok(ApiResponse.success(wishlistService.isInWishlist(getCurrentUser(), productId)));
    }

    @GetMapping("/recommendations")
    public ResponseEntity<ApiResponse<List<Product>>> getRecommendations(
            @RequestParam(defaultValue = "10") int limit) {
        return ResponseEntity.ok(ApiResponse.success("Recommendations retrieved",
                wishlistService.getRecommendations(getCurrentUser(), limit)));
    }
}
