package com.luztechnology.order.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.luztechnology.common.entity.BaseEntity;
import com.luztechnology.user.entity.CustomerAddress;
import com.luztechnology.user.entity.User;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "orders")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Order extends BaseEntity {

    @Column(nullable = false, unique = true)
    private String orderNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler", "cart", "wishlistItems", "roles", "password"})
    private User customer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cashier_id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler", "cart", "wishlistItems", "roles", "password"})
    private User cashier;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private OrderStatus status;

    private BigDecimal subTotalAmount;

    private BigDecimal discountAmount;

    private String couponCode;

    private BigDecimal taxAmount;

    private BigDecimal taxRate;

    @Column(nullable = false)
    private BigDecimal totalAmount;

    @Column(nullable = false)
    private String shippingAddress;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "shipping_address_id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler", "customer"})
    private CustomerAddress shippingAddressRef;

    private String shippingProvince;
    private String shippingDistrict;
    private String shippingSector;
    private String shippingCell;
    private String shippingVillage;

    @Column(length = 1000)
    private String deliveryInstructions;

    private String deliveryPhoneNumber;

    private String billingAddress;
    private String paymentReference;
    private String paymentMethod;

    @Column(nullable = false)
    @Builder.Default
    private String orderChannel = "ONLINE";

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private List<OrderItem> orderItems = new ArrayList<>();
}
