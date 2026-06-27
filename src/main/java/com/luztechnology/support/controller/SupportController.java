package com.luztechnology.support.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.security.services.UserDetailsImpl;
import com.luztechnology.support.dto.AssignTicketRequest;
import com.luztechnology.support.dto.MessageRequest;
import com.luztechnology.support.dto.SupportMessageResponse;
import com.luztechnology.support.dto.SurveyRequest;
import com.luztechnology.support.dto.TicketDetailResponse;
import com.luztechnology.support.dto.TicketRequest;
import com.luztechnology.support.entity.SupportTicket;
import com.luztechnology.support.service.SupportService;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/support")
@RequiredArgsConstructor
public class SupportController {

    private final SupportService supportService;
    private final UserRepository userRepository;

    @PostMapping("/tickets")
    @PreAuthorize("hasRole('CUSTOMER')")
    public ResponseEntity<ApiResponse<SupportTicket>> createTicket(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @RequestBody TicketRequest request) {
        User user = getCurrentUser(userDetails);
        SupportTicket ticket = supportService.createTicket(user, request.getTitle(), request.getDescription(),
                request.getPriority());
        return ResponseEntity.ok(ApiResponse.success("Ticket created", ticket));
    }

    @GetMapping("/tickets/my")
    @PreAuthorize("hasRole('CUSTOMER')")
    public ResponseEntity<ApiResponse<List<SupportTicket>>> getMyTickets(
            @AuthenticationPrincipal UserDetailsImpl userDetails) {
        User user = getCurrentUser(userDetails);
        List<SupportTicket> tickets = supportService.getCustomerTickets(user.getId());
        return ResponseEntity.ok(ApiResponse.success("My tickets retrieved", tickets));
    }

    @GetMapping("/tickets")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<List<SupportTicket>>> getAllTickets(
            @RequestParam(required = false) String status) {
        List<SupportTicket> tickets = status == null
                ? supportService.getAllTickets()
                : supportService.getAllTicketsByStatus(status.toUpperCase());
        return ResponseEntity.ok(ApiResponse.success("All tickets retrieved", tickets));
    }

    @GetMapping("/tickets/assigned")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<SupportTicket>>> getAssignedTickets(
            @AuthenticationPrincipal UserDetailsImpl userDetails) {
        List<SupportTicket> tickets = supportService.getAssignedTickets(userDetails.getId());
        return ResponseEntity.ok(ApiResponse.success("Assigned tickets retrieved", tickets));
    }

    @GetMapping("/tickets/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<TicketDetailResponse>> getTicket(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID id) {
        TicketDetailResponse detail = supportService.getTicketDetail(id);
        requireOwnerOrStaff(userDetails, detail.getCustomerId());
        return ResponseEntity.ok(ApiResponse.success("Ticket retrieved", detail));
    }

    @GetMapping("/tickets/{id}/messages")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<List<SupportMessageResponse>>> getTicketMessages(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID id) {
        SupportTicket ticket = supportService.getTicketById(id);
        requireOwnerOrStaff(userDetails, ticket.getCustomer().getId());
        return ResponseEntity.ok(ApiResponse.success("Messages retrieved", supportService.getTicketMessages(id)));
    }

    @PostMapping("/tickets/{id}/messages")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<SupportMessageResponse>> addMessage(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID id,
            @RequestBody MessageRequest request) {
        SupportTicket ticket = supportService.getTicketById(id);
        requireOwnerOrStaff(userDetails, ticket.getCustomer().getId());

        if ("CLOSED".equals(ticket.getStatus())) {
            throw new IllegalStateException("Cannot send messages to a closed ticket");
        }

        // Fix 9: only move to IN_PROGRESS from OPEN; never reopen a RESOLVED ticket
        if ("OPEN".equals(ticket.getStatus())) {
            ticket = supportService.updateStatus(id, "IN_PROGRESS");
        }

        User user = getCurrentUser(userDetails);
        SupportMessageResponse message = supportService.addMessage(ticket, user, request.getMessage());
        return ResponseEntity.ok(ApiResponse.success("Message added", message));
    }

    @PatchMapping("/tickets/{id}/assign")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<SupportTicket>> assignTicket(
            @PathVariable UUID id,
            @Valid @RequestBody AssignTicketRequest request) {
        SupportTicket ticket = supportService.assignTicket(id, request.getAgentId());
        return ResponseEntity.ok(ApiResponse.success("Ticket assigned", ticket));
    }

    // Fix 5: separate resolve endpoint sets status to RESOLVED (not CLOSED)
    @PatchMapping("/tickets/{id}/resolve")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<SupportTicket>> resolveTicket(@PathVariable UUID id) {
        SupportTicket ticket = supportService.updateStatus(id, "RESOLVED");
        return ResponseEntity.ok(ApiResponse.success("Ticket resolved", ticket));
    }

    @PatchMapping("/tickets/{id}/close")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<SupportTicket>> closeTicket(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID id) {
        // Fix 8: customer can only close their own ticket
        SupportTicket ticket = supportService.getTicketById(id);
        requireOwnerOrStaff(userDetails, ticket.getCustomer().getId());
        SupportTicket closed = supportService.updateStatus(id, "CLOSED");
        return ResponseEntity.ok(ApiResponse.success("Ticket closed", closed));
    }

    @PostMapping("/tickets/{id}/survey")
    @PreAuthorize("hasRole('CUSTOMER')")
    public ResponseEntity<ApiResponse<Object>> submitSurvey(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID id,
            @RequestBody SurveyRequest request) {
        SupportTicket ticket = supportService.getTicketById(id);
        requireOwnerOrStaff(userDetails, ticket.getCustomer().getId());
        supportService.submitSurvey(id, request.getRating(), request.getFeedback());
        return ResponseEntity.ok(ApiResponse.success("Survey submitted", null));
    }

    // ── helpers ──────────────────────────────────────────────

    private void requireOwnerOrStaff(UserDetailsImpl userDetails, UUID ownerId) {
        boolean isStaff = userDetails.getAuthorities().stream()
                .anyMatch(a -> "ROLE_ADMIN".equals(a.getAuthority())
                        || "ROLE_SUPPORT_AGENT".equals(a.getAuthority()));
        if (!isStaff && !userDetails.getId().equals(ownerId)) {
            throw new AccessDeniedException("You do not have access to this ticket");
        }
    }

    private User getCurrentUser(UserDetailsImpl userDetails) {
        return userRepository.findByEmail(userDetails.getEmail())
                .orElseThrow(() -> new ResourceNotFoundException("Logged user not found"));
    }
}
