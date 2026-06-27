package com.luztechnology.payment.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.luztechnology.common.entity.BaseEntity;
import com.luztechnology.order.entity.Order;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "payment_transactions")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PaymentTransaction extends BaseEntity {

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "order_id", nullable = false)
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler", "orderItems", "cashier"})
    private Order order;

    @Column(nullable = false)
    private String provider;

    private String paymentReference;

    @Column(nullable = false)
    private BigDecimal amount;

    @Column(nullable = false)
    private String status;

    @Column(nullable = false)
    private String transactionType;

    private String reconciliationStatus;

    @Column(columnDefinition = "TEXT")
    private String reconciliationNotes;

    private LocalDateTime reconciledAt;
}
