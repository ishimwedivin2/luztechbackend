package com.luztechnology.payment.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.repository.OrderRepository;
import com.luztechnology.payment.entity.PaymentTransaction;
import com.luztechnology.payment.repository.PaymentTransactionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class PaymentReconciliationService {

    private final PaymentTransactionRepository transactionRepository;
    private final OrderRepository orderRepository;

    @Transactional
    public PaymentTransaction recordInitiated(Order order, String provider, String paymentReference) {
        PaymentTransaction transaction = PaymentTransaction.builder()
                .order(order)
                .provider(provider)
                .paymentReference(paymentReference)
                .amount(safeAmount(order))
                .status("INITIATED")
                .transactionType("PAYMENT")
                .reconciliationStatus("PENDING")
                .build();
        return transactionRepository.save(transaction);
    }

    @Transactional
    public PaymentTransaction recordWebhook(Order order, String provider, boolean verified) {
        PaymentTransaction transaction = transactionRepository.findTopByOrderIdOrderByCreatedAtDesc(order.getId())
                .orElseGet(() -> PaymentTransaction.builder()
                        .order(order)
                        .provider(provider)
                        .paymentReference(order.getPaymentReference())
                        .amount(safeAmount(order))
                        .transactionType("PAYMENT")
                        .build());

        transaction.setProvider(provider);
        transaction.setPaymentReference(order.getPaymentReference());
        transaction.setAmount(safeAmount(order));
        transaction.setStatus(verified ? "PAID" : "FAILED");
        transaction.setReconciliationStatus("PENDING");
        return transactionRepository.save(transaction);
    }

    @Transactional(readOnly = true)
    public List<PaymentTransaction> getTransactions(UUID orderId) {
        return orderId == null ? transactionRepository.findAll() : transactionRepository.findByOrderId(orderId);
    }

    @Transactional
    public PaymentTransaction reconcileTransaction(UUID transactionId) {
        PaymentTransaction transaction = transactionRepository.findById(transactionId)
                .orElseThrow(() -> new ResourceNotFoundException("Payment transaction not found"));
        reconcile(transaction);
        return transactionRepository.save(transaction);
    }

    @Transactional
    public Map<String, Object> reconcileAll() {
        List<PaymentTransaction> transactions = transactionRepository.findAll();
        transactions.forEach(this::reconcile);
        transactionRepository.saveAll(transactions);
        return buildSummary(transactions);
    }

    @Transactional(readOnly = true)
    public Map<String, Object> getSummary() {
        return buildSummary(transactionRepository.findAll());
    }

    private void reconcile(PaymentTransaction transaction) {
        Order order = transaction.getOrder();
        boolean paidTransaction = "PAID".equalsIgnoreCase(transaction.getStatus());
        boolean paidOrder = order.getStatus() == OrderStatus.PAID
                || order.getStatus() == OrderStatus.PROCESSING
                || order.getStatus() == OrderStatus.SHIPPED
                || order.getStatus() == OrderStatus.DELIVERED;
        boolean amountMatches = safeAmount(order).compareTo(transaction.getAmount()) == 0;
        boolean referenceMatches = order.getPaymentReference() == null
                || transaction.getPaymentReference() == null
                || order.getPaymentReference().equals(transaction.getPaymentReference());

        if (paidTransaction && paidOrder && amountMatches && referenceMatches) {
            transaction.setReconciliationStatus("MATCHED");
            transaction.setReconciliationNotes("Payment, order status, amount, and reference match.");
        } else if (!paidTransaction && !paidOrder) {
            transaction.setReconciliationStatus("PENDING");
            transaction.setReconciliationNotes("Payment has not been confirmed yet.");
        } else {
            transaction.setReconciliationStatus("MISMATCH");
            transaction.setReconciliationNotes("Order/payment status, amount, or reference does not match.");
        }
        transaction.setReconciledAt(LocalDateTime.now());
    }

    private Map<String, Object> buildSummary(List<PaymentTransaction> transactions) {
        Map<String, Long> byStatus = transactions.stream()
                .collect(Collectors.groupingBy(t -> t.getReconciliationStatus() == null ? "UNRECONCILED" : t.getReconciliationStatus(),
                        Collectors.counting()));
        BigDecimal matchedAmount = transactions.stream()
                .filter(t -> "MATCHED".equalsIgnoreCase(t.getReconciliationStatus()))
                .map(PaymentTransaction::getAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        BigDecimal pendingAmount = transactions.stream()
                .filter(t -> !"MATCHED".equalsIgnoreCase(t.getReconciliationStatus()))
                .map(PaymentTransaction::getAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        Map<String, Object> summary = new HashMap<>();
        summary.put("totalTransactions", transactions.size());
        summary.put("statusBreakdown", byStatus);
        summary.put("matchedAmount", matchedAmount);
        summary.put("pendingOrMismatchAmount", pendingAmount);
        return summary;
    }

    private BigDecimal safeAmount(Order order) {
        return order.getTotalAmount() == null ? BigDecimal.ZERO : order.getTotalAmount();
    }
}
