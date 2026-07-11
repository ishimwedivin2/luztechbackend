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
import com.luztechnology.product.service.ProductPricingService;
import com.luztechnology.user.dto.CustomerAddressRequest;
import com.luztechnology.user.entity.CustomerAddress;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import com.luztechnology.user.service.CustomerAddressService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
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
    private final CustomerAddressService customerAddressService;
    private final ProductPricingService productPricingService;

    @Transactional
    public CartResponse getCart(User user) {
        Cart cart = getOrCreateCart(user);
        normalizeCart(cart);
        return toResponse(cartRepository.findById(cart.getId()).orElse(cart));
    }

    @Transactional
    public CartResponse addItem(User user, UUID productId, int quantity) {
        Cart cart = getOrCreateCart(user);
        normalizeCart(cart);
        Product product = getActiveProduct(productId);

        List<CartItem> matches = cartItemRepository.findAllByCartAndProductId(cart, productId);
        CartItem item = matches.isEmpty()
                ? CartItem.builder()
                        .cart(cart)
                        .product(product)
                        .quantity(0)
                        .build()
                : matches.get(0);
        item.setQuantity(item.getQuantity() + quantity);
        cartItemRepository.save(item);

        return toResponse(cartRepository.findById(cart.getId()).orElse(cart));
    }

    @Transactional
    public CartResponse updateItem(User user, UUID productId, int quantity) {
        Cart cart = getOrCreateCart(user);
        normalizeCart(cart);
        List<CartItem> matches = cartItemRepository.findAllByCartAndProductId(cart, productId);
        if (matches.isEmpty()) {
            throw new ResourceNotFoundException("Product is not in the cart");
        }
        CartItem item = matches.get(0);

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
        List<CartItem> itemsToRemove = new ArrayList<>(cartItemRepository.findAllByCartAndProductId(cart, productId));
        cart.getItems().removeIf(item -> item.getProduct().getId().equals(productId));
        cartItemRepository.deleteAll(itemsToRemove);
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
        normalizeCart(cart);
        if (cart.getItems().isEmpty()) {
            throw new IllegalStateException("Cannot checkout an empty cart");
        }

        OrderRequestDTO orderRequest = new OrderRequestDTO();
        applyShippingAddress(user, request, orderRequest);
        orderRequest.setBillingAddress(request.getBillingAddress());
        orderRequest.setPaymentMethod(request.getPaymentMethod());

        List<OrderRequestDTO.OrderItemDTO> itemDTOs = cart.getItems().stream()
                .map(item -> {
                    OrderRequestDTO.OrderItemDTO dto = new OrderRequestDTO.OrderItemDTO();
                    dto.setProductId(item.getProduct().getId());
                    dto.setQuantity(item.getQuantity());
                    dto.setUnitPrice(productPricingService.effectiveUnitPrice(item.getProduct()));
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

    private void applyShippingAddress(User user, CheckoutRequest request, OrderRequestDTO orderRequest) {
        if (request.getShippingAddressId() != null) {
            CustomerAddress saved = customerAddressService.getAddressEntity(user, request.getShippingAddressId());
            orderRequest.setShippingAddressId(saved.getId());
            orderRequest.setShippingProvince(saved.getProvince());
            orderRequest.setShippingDistrict(saved.getDistrict());
            orderRequest.setShippingSector(saved.getSector());
            orderRequest.setShippingCell(saved.getCell());
            orderRequest.setShippingVillage(saved.getVillage());
            String instructions = firstNonBlank(request.getDeliveryInstructions(), saved.getDeliveryInstructions());
            orderRequest.setDeliveryInstructions(instructions);
            orderRequest.setDeliveryPhoneNumber(firstNonBlank(request.getDeliveryPhoneNumber(), saved.getDeliveryPhoneNumber()));
            orderRequest.setShippingAddress(customerAddressService.formatAddress(
                    saved.getProvince(),
                    saved.getDistrict(),
                    saved.getSector(),
                    saved.getCell(),
                    saved.getVillage(),
                    instructions));
            return;
        }

        CheckoutRequest.ShippingAddressDTO details = request.getShippingAddressDetails();
        if (details != null) {
            validateAddressDetails(details);
            CustomerAddress saved = null;
            if (request.isSaveShippingAddress()) {
                CustomerAddressRequest addressRequest = new CustomerAddressRequest();
                addressRequest.setLabel(details.getLabel());
                addressRequest.setProvince(details.getProvince());
                addressRequest.setDistrict(details.getDistrict());
                addressRequest.setSector(details.getSector());
                addressRequest.setCell(details.getCell());
                addressRequest.setVillage(details.getVillage());
                addressRequest.setDeliveryInstructions(details.getDeliveryInstructions());
                addressRequest.setDeliveryPhoneNumber(details.getDeliveryPhoneNumber());
                addressRequest.setDefaultAddress(details.isDefaultAddress());
                saved = customerAddressService.createAddress(user, addressRequest);
                orderRequest.setShippingAddressId(saved.getId());
            }

            orderRequest.setShippingProvince(clean(details.getProvince()));
            orderRequest.setShippingDistrict(clean(details.getDistrict()));
            orderRequest.setShippingSector(clean(details.getSector()));
            orderRequest.setShippingCell(clean(details.getCell()));
            orderRequest.setShippingVillage(clean(details.getVillage()));
            orderRequest.setDeliveryInstructions(clean(details.getDeliveryInstructions()));
            orderRequest.setDeliveryPhoneNumber(clean(details.getDeliveryPhoneNumber()));
            orderRequest.setShippingAddress(customerAddressService.formatAddress(
                    details.getProvince(),
                    details.getDistrict(),
                    details.getSector(),
                    details.getCell(),
                    details.getVillage(),
                    details.getDeliveryInstructions()));
            return;
        }

        if (request.getShippingAddress() == null || request.getShippingAddress().isBlank()) {
            throw new IllegalArgumentException("Shipping address is required");
        }
        orderRequest.setShippingAddress(request.getShippingAddress().trim());
    }

    private void validateAddressDetails(CheckoutRequest.ShippingAddressDTO details) {
        if (isBlank(details.getProvince()) || isBlank(details.getDistrict()) || isBlank(details.getSector())
                || isBlank(details.getCell()) || isBlank(details.getVillage())) {
            throw new IllegalArgumentException("Province, district, sector, cell and village are required");
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }

    private String clean(String value) {
        return value == null ? null : value.trim();
    }

    private String firstNonBlank(String first, String fallback) {
        return isBlank(first) ? clean(fallback) : clean(first);
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

    private void normalizeCart(Cart cart) {
        Map<UUID, CartItem> byProduct = new LinkedHashMap<>();
        List<CartItem> duplicates = new ArrayList<>();

        for (CartItem item : new ArrayList<>(cart.getItems())) {
            UUID productId = item.getProduct().getId();
            CartItem existing = byProduct.putIfAbsent(productId, item);
            if (existing != null) {
                existing.setQuantity(existing.getQuantity() + item.getQuantity());
                duplicates.add(item);
                cart.getItems().remove(item);
            }
        }

        if (!duplicates.isEmpty()) {
            cartItemRepository.deleteAll(duplicates);
            cartItemRepository.saveAll(byProduct.values());
            cartRepository.save(cart);
        }
    }

    private CartResponse toResponse(Cart cart) {
        List<CartItemResponse> items = cart.getItems().stream()
                .map(item -> {
                    Product product = item.getProduct();
                    BigDecimal originalUnitPrice = productPricingService.originalUnitPrice(product);
                    BigDecimal unitPrice = productPricingService.effectiveUnitPrice(product);
                    BigDecimal unitDiscountAmount = productPricingService.unitDiscountAmount(product);
                    BigDecimal lineDiscountAmount = unitDiscountAmount
                            .multiply(BigDecimal.valueOf(item.getQuantity()));
                    BigDecimal subTotal = unitPrice
                            .multiply(BigDecimal.valueOf(item.getQuantity()));
                    String imageUrl = product.getImages().stream()
                            .filter(img -> img.isPrimary())
                            .map(img -> img.getUrl())
                            .findFirst()
                            .orElseGet(() -> product.getImages().isEmpty()
                                    ? null
                                    : product.getImages().get(0).getUrl());
                    return CartItemResponse.builder()
                            .id(item.getId())
                            .productId(product.getId())
                            .productName(product.getName())
                            .sku(product.getSku())
                            .quantity(item.getQuantity())
                            .originalUnitPrice(originalUnitPrice)
                            .unitPrice(unitPrice)
                            .discountPercentage(productPricingService.activeDiscountPercentage(product))
                            .discountAmount(lineDiscountAmount)
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
