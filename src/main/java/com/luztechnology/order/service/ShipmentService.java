package com.luztechnology.order.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.order.dto.CreateShipmentRequest;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.entity.Shipment;
import com.luztechnology.order.repository.ShipmentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ShipmentService {

    private static final String PENDING = "PENDING";
    private static final String IN_TRANSIT = "IN_TRANSIT";
    private static final String DELIVERED = "DELIVERED";
    private static final String CANCELLED = "CANCELLED";

    private final ShipmentRepository shipmentRepository;
    private final OrderService orderService;

    @Transactional(readOnly = true)
    public Page<Shipment> getShipments(String status, int page, int size) {
        var pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        if (status == null || status.isBlank()) {
            return shipmentRepository.findAll(pageable);
        }
        List<Shipment> filtered = shipmentRepository.findByStatus(status.toUpperCase());
        int start = (int) pageable.getOffset();
        int end = Math.min(start + pageable.getPageSize(), filtered.size());
        List<Shipment> pageContent = start > filtered.size() ? List.of() : filtered.subList(start, end);
        return new PageImpl<>(pageContent, pageable, filtered.size());
    }

    @Transactional(readOnly = true)
    public Shipment getShipmentById(UUID id) {
        return shipmentRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Shipment not found with id: " + id));
    }

    @Transactional(readOnly = true)
    public Shipment getShipmentByOrderId(UUID orderId) {
        return shipmentRepository.findByOrderId(orderId)
                .orElseThrow(() -> new ResourceNotFoundException("Shipment not found for order id: " + orderId));
    }

    @Transactional(readOnly = true)
    public Shipment getShipmentByTrackingNumber(String trackingNumber) {
        return shipmentRepository.findByTrackingNumber(trackingNumber)
                .orElseThrow(() -> new ResourceNotFoundException("Shipment not found for tracking number: " + trackingNumber));
    }

    @Transactional
    public Shipment createShipment(CreateShipmentRequest request) {
        Order order = orderService.getOrderById(request.getOrderId());
        shipmentRepository.findByOrderId(order.getId()).ifPresent(existing -> {
            throw new IllegalStateException("Shipment already exists for this order");
        });

        if (order.getStatus() == OrderStatus.CANCELLED || order.getStatus() == OrderStatus.REFUNDED) {
            throw new IllegalStateException("Cannot ship a cancelled or refunded order");
        }
        if (order.getStatus() == OrderStatus.PAID || order.getStatus() == OrderStatus.CREATED) {
            orderService.updateOrderStatus(order.getId(), OrderStatus.PROCESSING);
        }

        Shipment shipment = Shipment.builder()
                .order(order)
                .trackingNumber(request.getTrackingNumber() == null || request.getTrackingNumber().isBlank()
                        ? generateTrackingNumber()
                        : request.getTrackingNumber())
                .carrier(request.getCarrier())
                .status(PENDING)
                .estimatedDeliveryDate(request.getEstimatedDeliveryDate())
                .build();

        return shipmentRepository.save(shipment);
    }

    @Transactional
    public Shipment updateStatus(UUID id, String status, LocalDateTime actualDeliveryDate) {
        Shipment shipment = getShipmentById(id);
        String normalizedStatus = status.toUpperCase();
        validateStatus(normalizedStatus);

        shipment.setStatus(normalizedStatus);
        if (DELIVERED.equals(normalizedStatus)) {
            shipment.setActualDeliveryDate(actualDeliveryDate == null ? LocalDateTime.now() : actualDeliveryDate);
            orderService.updateOrderStatus(shipment.getOrder().getId(), OrderStatus.DELIVERED);
        } else if (IN_TRANSIT.equals(normalizedStatus)) {
            orderService.updateOrderStatus(shipment.getOrder().getId(), OrderStatus.SHIPPED);
        }

        return shipmentRepository.save(shipment);
    }

    @Transactional
    public Shipment cancelShipment(UUID id) {
        Shipment shipment = getShipmentById(id);
        if (DELIVERED.equalsIgnoreCase(shipment.getStatus())) {
            throw new IllegalStateException("Cannot cancel a delivered shipment");
        }
        shipment.setStatus(CANCELLED);
        return shipmentRepository.save(shipment);
    }

    private void validateStatus(String status) {
        if (!PENDING.equals(status) && !IN_TRANSIT.equals(status) && !DELIVERED.equals(status) && !CANCELLED.equals(status)) {
            throw new IllegalArgumentException("Unsupported shipment status: " + status);
        }
    }

    private String generateTrackingNumber() {
        return "TRK-" + System.currentTimeMillis() + "-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}
