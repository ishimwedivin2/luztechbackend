package com.luztechnology.order.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.order.dto.CompleteReturnRequest;
import com.luztechnology.order.dto.CreateReturnRequest;
import com.luztechnology.order.dto.RefundReturnRequest;
import com.luztechnology.order.dto.ReviewReturnRequest;
import com.luztechnology.order.entity.ReturnRequest;
import com.luztechnology.order.service.ReturnService;
import com.luztechnology.security.services.UserDetailsImpl;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/returns")
@RequiredArgsConstructor
public class ReturnController {

    private final ReturnService returnService;
    private final UserRepository userRepository;

    @GetMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<ReturnRequest>>> getReturns(
            @RequestParam(required = false) String status) {
        return ResponseEntity.ok(ApiResponse.success(returnService.getReturns(status)));
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<ReturnRequest>> getReturn(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success(returnService.getReturnById(id)));
    }

    @GetMapping("/order/{orderId}")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<ReturnRequest>> getReturnByOrder(@PathVariable UUID orderId) {
        return ResponseEntity.ok(ApiResponse.success(returnService.getReturnByOrderId(orderId)));
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<ReturnRequest>> createReturn(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @Valid @RequestBody CreateReturnRequest request) {
        ReturnRequest returnRequest = returnService.createReturnRequest(
                request.getOrderId(),
                request.getReason(),
                getCurrentUser(userDetails));
        return ResponseEntity.ok(ApiResponse.success("Return request created", returnRequest));
    }

    @PostMapping("/{id}/approve")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<ReturnRequest>> approveReturn(
            @PathVariable UUID id,
            @RequestBody(required = false) ReviewReturnRequest request) {
        String notes = request == null ? null : request.getAdminNotes();
        return ResponseEntity.ok(ApiResponse.success("Return approved", returnService.approveReturn(id, notes)));
    }

    @PostMapping("/{id}/reject")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<ReturnRequest>> rejectReturn(
            @PathVariable UUID id,
            @RequestBody(required = false) ReviewReturnRequest request) {
        String notes = request == null ? null : request.getAdminNotes();
        return ResponseEntity.ok(ApiResponse.success("Return rejected", returnService.rejectReturn(id, notes)));
    }

    @PostMapping("/{id}/refund")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<ReturnRequest>> refundReturn(
            @PathVariable UUID id,
            @RequestBody(required = false) RefundReturnRequest request) {
        RefundReturnRequest body = request == null ? new RefundReturnRequest() : request;
        ReturnRequest returnRequest = returnService.initiateRefund(
                id,
                body.getRefundedAmount(),
                body.getAdminNotes());
        return ResponseEntity.ok(ApiResponse.success("Refund submitted to payment provider", returnRequest));
    }

    @PostMapping("/{id}/refund/status")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<ReturnRequest>> syncRefundStatus(@PathVariable UUID id) {
        ReturnRequest returnRequest = returnService.syncRefundStatus(id);
        return ResponseEntity.ok(ApiResponse.success("Refund status synced", returnRequest));
    }

    @PostMapping("/{id}/complete")
    @PreAuthorize("hasAnyRole('ADMIN', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<ReturnRequest>> completeReturn(
            @PathVariable UUID id,
            @RequestBody(required = false) CompleteReturnRequest request) {
        CompleteReturnRequest body = request == null ? new CompleteReturnRequest() : request;
        ReturnRequest returnRequest = returnService.completeReturn(
                id,
                body.getRefundedAmount(),
                body.getRefundReference(),
                body.getAdminNotes());
        return ResponseEntity.ok(ApiResponse.success("Return completed and refund recorded", returnRequest));
    }

    private User getCurrentUser(UserDetailsImpl userDetails) {
        return userRepository.findByEmail(userDetails.getEmail())
                .orElseThrow(() -> new ResourceNotFoundException("Logged user not found"));
    }
}
