package com.luztechnology.cart.service;

import com.luztechnology.cart.dto.CartItemResponse;
import com.luztechnology.cart.dto.CartResponse;
import com.luztechnology.cart.dto.CheckoutRequest;
import com.luztechnology.cart.entity.Cart;
import com.luztechnology.cart.entity.CartItem;
import com.luztechnology.cart.repository.CartItemRepository;
import com.luztechnology.cart.repository.CartRepository;
import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.finance.entity.Coupon;
import com.luztechnology.finance.service.CouponService;
import com.luztechnology.order.dto.OrderRequestDTO;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.service.OrderService;
import com.luztechnology.product.entity.Product;
import com.luztechnology.product.entity.ProductStatus;
import com.luztechnology.product.repository.ProductRepository;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class CartService {

    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    private final OrderService orderService;
    private final CouponService couponService;

    @Transactional
    public CartResponse getCart(User user) {
        return toResponse(getOrCreateCart(user));
    }

    @Transactional
    public CartResponse addItem(User user, UUID productId, int quantity) {
        Cart cart = getOrCreateCart(user);
        Product product = getActiveProduct(productId);

        CartItem item = cartItemRepository.findByCartAndProductId(cart, productId)
                .orElseGet(() -> CartItem.builder()
                        .cart(cart)
                        .product(product)
                        .quantity(0)
                        .build());
        item.setQuantity(item.getQuantity() + quantity);
        cartItemRepository.save(item);

        return toResponse(cartRepository.findById(cart.getId()).orElse(cart));
    }

    @Transactional
    public CartResponse updateItem(User user, UUID productId, int quantity) {
        Cart cart = getOrCreateCart(user);
        CartItem item = cartItemRepository.findByCartAndProductId(cart, productId)
                .orElseThrow(() -> new ResourceNotFoundException("Product is not in the cart"));

        if (quantity <= 0) {
            cartItemRepository.delete(item);
        } else {
            item.setQuantity(quantity);
            cartItemRepository.save(item);
        }

        return toResponse(cartRepository.findById(cart.getId()).orElse(cart));
    }

    @Transactional
    public CartResponse removeItem(User user, UUID productId) {
        Cart cart = getOrCreateCart(user);
        cart.getItems().removeIf(item -> item.getProduct().getId().equals(productId));
        cartRepository.save(cart);
        return toResponse(cartRepository.findById(cart.getId()).orElse(cart));
    }

    @Transactional
    public void clearCart(User user) {
        Cart cart = getOrCreateCart(user);
        cart.getItems().clear();
        cartRepository.save(cart);
    }

    @Transactional
    public Order checkout(User user, CheckoutRequest request) {
        Cart cart = getOrCreateCart(user);
        if (cart.getItems().isEmpty()) {
            throw new IllegalStateException("Cannot checkout an empty cart");
        }

        OrderRequestDTO orderRequest = new OrderRequestDTO();
        orderRequest.setShippingAddress(request.getShippingAddress());
        orderRequest.setBillingAddress(request.getBillingAddress());
        orderRequest.setPaymentMethod(request.getPaymentMethod());

        List<OrderRequestDTO.OrderItemDTO> itemDTOs = cart.getItems().stream()
                .map(item -> {
                    OrderRequestDTO.OrderItemDTO dto = new OrderRequestDTO.OrderItemDTO();
                    dto.setProductId(item.getProduct().getId());
                    dto.setQuantity(item.getQuantity());
                    dto.setUnitPrice(item.getProduct().getPrice());
                    return dto;
                })
                .toList();
        orderRequest.setItems(itemDTOs);

        // Apply coupon discount if provided
        if (request.getCouponCode() != null && !request.getCouponCode().isBlank()) {
            try {
                Coupon coupon = couponService.getCouponByCode(request.getCouponCode());
                BigDecimal subtotal = itemDTOs.stream()
                        .map(i -> i.getUnitPrice().multiply(BigDecimal.valueOf(i.getQuantity())))
                        .reduce(BigDecimal.ZERO, BigDecimal::add);
                BigDecimal discount = couponService.calculateDiscount(coupon, subtotal);
                orderRequest.setDiscountAmount(discount.min(subtotal));
                orderRequest.setCouponCode(request.getCouponCode());
                couponService.incrementUsage(request.getCouponCode());
            } catch (Exception e) {
                throw new IllegalArgumentException("Invalid coupon: " + e.getMessage());
            }
        }

        return orderService.processOrderForCustomer(user, orderRequest);
    }

    private Cart getOrCreateCart(User user) {
        User managedUser = userRepository.findById(user.getId())
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));
        return cartRepository.findByUser(managedUser)
                .orElseGet(() -> cartRepository.save(Cart.builder().user(managedUser).build()));
    }

    private Product getActiveProduct(UUID productId) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new ResourceNotFoundException("Product not found with id: " + productId));
        if (product.getStatus() != ProductStatus.ACTIVE) {
            throw new IllegalStateException("Product is not available for purchase");
        }
        return product;
    }

    private CartResponse toResponse(Cart cart) {
        List<CartItemResponse> items = cart.getItems().stream()
                .map(item -> {
                    BigDecimal subTotal = item.getProduct().getPrice()
                            .multiply(BigDecimal.valueOf(item.getQuantity()));
                    String imageUrl = item.getProduct().getImages().stream()
                            .filter(img -> img.isPrimary())
                            .map(img -> img.getUrl())
                            .findFirst()
                            .orElseGet(() -> item.getProduct().getImages().isEmpty()
                                    ? null
                                    : item.getProduct().getImages().get(0).getUrl());
                    return CartItemResponse.builder()
                            .id(item.getId())
                            .productId(item.getProduct().getId())
                            .productName(item.getProduct().getName())
                            .sku(item.getProduct().getSku())
                            .quantity(item.getQuantity())
                            .unitPrice(item.getProduct().getPrice())
                            .subTotal(subTotal)
                            .imageUrl(imageUrl)
                            .build();
                })
                .toList();

        BigDecimal total = items.stream()
                .map(CartItemResponse::getSubTotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        int totalItems = items.stream().mapToInt(CartItemResponse::getQuantity).sum();

        return CartResponse.builder()
                .id(cart.getId())
                .items(items)
                .totalAmount(total)
                .totalItems(totalItems)
                .build();
    }
}
