package com.luztechnology.cart.controller;

import com.luztechnology.cart.dto.AddCartItemRequest;
import com.luztechnology.cart.dto.CartResponse;
import com.luztechnology.cart.dto.CheckoutRequest;
import com.luztechnology.cart.service.CartService;
import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.order.entity.Order;
import com.luztechnology.security.services.UserDetailsImpl;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping("/api/cart")
@RequiredArgsConstructor
@PreAuthorize("hasRole('CUSTOMER')")
public class CartController {

    private final CartService cartService;
    private final UserRepository userRepository;

    @GetMapping
    public ResponseEntity<ApiResponse<CartResponse>> getCart(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        return ResponseEntity.ok(ApiResponse.success(cartService.getCart(getCurrentUser(userDetails))));
    }

    @PostMapping("/items")
    public ResponseEntity<ApiResponse<CartResponse>> addItem(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @Valid @RequestBody AddCartItemRequest request) {
        CartResponse cart = cartService.addItem(getCurrentUser(userDetails), request.getProductId(), request.getQuantity());
        return ResponseEntity.ok(ApiResponse.success("Item added to cart", cart));
    }

    @PatchMapping("/items/{productId}")
    public ResponseEntity<ApiResponse<CartResponse>> updateItem(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID productId,
            @RequestParam int quantity) {
        CartResponse cart = cartService.updateItem(getCurrentUser(userDetails), productId, quantity);
        return ResponseEntity.ok(ApiResponse.success("Cart item updated", cart));
    }

    @DeleteMapping("/items/{productId}")
    public ResponseEntity<ApiResponse<CartResponse>> removeItem(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID productId) {
        CartResponse cart = cartService.removeItem(getCurrentUser(userDetails), productId);
        return ResponseEntity.ok(ApiResponse.success("Item removed from cart", cart));
    }

    @DeleteMapping
    public ResponseEntity<ApiResponse<String>> clearCart(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        cartService.clearCart(getCurrentUser(userDetails));
        return ResponseEntity.ok(ApiResponse.success("Cart cleared", null));
    }

    @PostMapping("/checkout")
    public ResponseEntity<ApiResponse<Order>> checkout(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @Valid @RequestBody CheckoutRequest request) {
        Order order = cartService.checkout(getCurrentUser(userDetails), request);
        return ResponseEntity.ok(ApiResponse.success("Order created from cart", order));
    }

    private User getCurrentUser(UserDetailsImpl userDetails) {
        return userRepository.findByEmail(userDetails.getEmail())
                .orElseThrow(() -> new ResourceNotFoundException("Logged user not found"));
    }
}
