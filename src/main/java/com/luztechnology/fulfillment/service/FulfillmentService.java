package com.luztechnology.fulfillment.service;

import com.luztechnology.fulfillment.dto.DispatchFulfillmentRequest;
import com.luztechnology.fulfillment.dto.FulfillmentResponse;
import com.luztechnology.fulfillment.entity.FulfillmentOrder;
import com.luztechnology.fulfillment.repository.FulfillmentOrderRepository;
import com.luztechnology.order.dto.CreateShipmentRequest;
import com.luztechnology.order.entity.Order;
import com.luztechnology.order.entity.OrderStatus;
import com.luztechnology.order.entity.Shipment;
import com.luztechnology.order.repository.ShipmentRepository;
import com.luztechnology.order.service.OrderService;
import com.luztechnology.order.service.ShipmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class FulfillmentService {

    private static final String PICKED = "PICKED";
    private static final String PACKED = "PACKED";
    private static final String DISPATCHED = "DISPATCHED";
    private static final String COMPLETED = "COMPLETED";

    private final FulfillmentOrderRepository fulfillmentOrderRepository;
    private final ShipmentRepository shipmentRepository;
    private final OrderService orderService;
    private final ShipmentService shipmentService;

    @Transactional
    public FulfillmentResponse pickOrder(UUID orderId) {
        Order order = orderService.getOrderById(orderId);
        validateCanFulfill(order);
        validateHasItems(order);

        FulfillmentOrder fulfillment = fulfillmentOrderRepository.findByOrderId(orderId)
                .orElseGet(() -> FulfillmentOrder.builder()
                        .order(order)
                        .status(PICKED)
                        .build());

        if (COMPLETED.equals(fulfillment.getStatus())) {
            throw new IllegalStateException("Completed fulfillment cannot be picked again");
        }

        fulfillment.setStatus(PICKED);
        fulfillment.setPickedAt(LocalDateTime.now());
        orderService.updateOrderStatus(orderId, OrderStatus.PROCESSING);
        return toResponse(fulfillmentOrderRepository.save(fulfillment));
    }

    @Transactional
    public FulfillmentResponse packOrder(UUID orderId) {
        FulfillmentOrder fulfillment = getFulfillmentForOrder(orderId);
        if (!PICKED.equals(fulfillment.getStatus())) {
            throw new IllegalStateException("Only picked orders can be packed");
        }

        fulfillment.setStatus(PACKED);
        fulfillment.setPackedAt(LocalDateTime.now());
        return toResponse(fulfillmentOrderRepository.save(fulfillment));
    }

    @Transactional
    public FulfillmentResponse dispatchOrder(UUID orderId, DispatchFulfillmentRequest request) {
        FulfillmentOrder fulfillment = getFulfillmentForOrder(orderId);
        if (!PACKED.equals(fulfillment.getStatus())) {
            throw new IllegalStateException("Only packed orders can be dispatched");
        }

        Shipment shipment = shipmentRepository.findByOrderId(orderId)
                .orElseGet(() -> shipmentService.createShipment(toShipmentRequest(orderId, request)));
        shipment = shipmentService.updateStatus(shipment.getId(), "IN_TRANSIT", null);

        fulfillment.setShipment(shipment);
        fulfillment.setStatus(DISPATCHED);
        fulfillment.setDispatchedAt(LocalDateTime.now());
        return toResponse(fulfillmentOrderRepository.save(fulfillment));
    }

    @Transactional
    public FulfillmentResponse completeOrder(UUID orderId) {
        FulfillmentOrder fulfillment = getFulfillmentForOrder(orderId);
        if (!DISPATCHED.equals(fulfillment.getStatus())) {
            throw new IllegalStateException("Only dispatched orders can be completed");
        }
        if (fulfillment.getShipment() == null) {
            throw new IllegalStateException("Cannot complete fulfillment without a shipment");
        }

        Shipment shipment = shipmentService.updateStatus(fulfillment.getShipment().getId(), "DELIVERED", LocalDateTime.now());
        fulfillment.setShipment(shipment);
        fulfillment.setStatus(COMPLETED);
        fulfillment.setCompletedAt(LocalDateTime.now());
        return toResponse(fulfillmentOrderRepository.save(fulfillment));
    }

    @Transactional(readOnly = true)
    public FulfillmentResponse getFulfillment(UUID orderId) {
        return toResponse(getFulfillmentForOrder(orderId));
    }

    private FulfillmentOrder getFulfillmentForOrder(UUID orderId) {
        return fulfillmentOrderRepository.findByOrderId(orderId)
                .orElseThrow(() -> new IllegalStateException("Fulfillment has not been started for this order"));
    }

    private void validateCanFulfill(Order order) {
        if (order.getStatus() == OrderStatus.CANCELLED
                || order.getStatus() == OrderStatus.REFUNDED
                || order.getStatus() == OrderStatus.RETURNED
                || order.getStatus() == OrderStatus.DELIVERED) {
            throw new IllegalStateException("Order cannot be fulfilled while status is " + order.getStatus());
        }
        if (order.getStatus() != OrderStatus.PAID
                && order.getStatus() != OrderStatus.CREATED
                && order.getStatus() != OrderStatus.PROCESSING) {
            throw new IllegalStateException("Only paid, created, or processing orders can enter fulfillment");
        }
    }

    private void validateHasItems(Order order) {
        if (order.getOrderItems() == null || order.getOrderItems().isEmpty()) {
            throw new IllegalStateException("Cannot fulfill an order without items");
        }
    }

    private CreateShipmentRequest toShipmentRequest(UUID orderId, DispatchFulfillmentRequest request) {
        CreateShipmentRequest shipmentRequest = new CreateShipmentRequest();
        shipmentRequest.setOrderId(orderId);
        shipmentRequest.setTrackingNumber(request.getTrackingNumber());
        shipmentRequest.setCarrier(request.getCarrier());
        shipmentRequest.setEstimatedDeliveryDate(request.getEstimatedDeliveryDate());
        return shipmentRequest;
    }

    private FulfillmentResponse toResponse(FulfillmentOrder fulfillment) {
        Order order = fulfillment.getOrder();
        Shipment shipment = fulfillment.getShipment();
        return FulfillmentResponse.builder()
                .fulfillmentId(fulfillment.getId())
                .orderId(order.getId())
                .orderNumber(order.getOrderNumber())
                .orderStatus(order.getStatus())
                .fulfillmentStatus(fulfillment.getStatus())
                .shipmentId(shipment == null ? null : shipment.getId())
                .trackingNumber(shipment == null ? null : shipment.getTrackingNumber())
                .carrier(shipment == null ? null : shipment.getCarrier())
                .shipmentStatus(shipment == null ? null : shipment.getStatus())
                .pickedAt(fulfillment.getPickedAt())
                .packedAt(fulfillment.getPackedAt())
                .dispatchedAt(fulfillment.getDispatchedAt())
                .completedAt(fulfillment.getCompletedAt())
                .build();
    }
}
