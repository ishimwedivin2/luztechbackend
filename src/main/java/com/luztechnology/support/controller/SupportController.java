package com.luztechnology.support.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.security.services.UserDetailsImpl;
import com.luztechnology.support.dto.MessageRequest;
import com.luztechnology.support.dto.SurveyRequest;
import com.luztechnology.support.dto.TicketRequest;
import com.luztechnology.support.entity.SupportMessage;
import com.luztechnology.support.entity.SupportTicket;
import com.luztechnology.support.service.SupportService;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
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
    public ResponseEntity<ApiResponse<List<SupportTicket>>> getAllTickets() {
        List<SupportTicket> tickets = supportService.getAllTickets();
        return ResponseEntity.ok(ApiResponse.success("All tickets retrieved", tickets));
    }

    @GetMapping("/tickets/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<SupportTicket>> getTicket(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID id) {
        SupportTicket ticket = supportService.getTicketById(id);
        User user = getCurrentUser(userDetails);
        boolean isStaff = userDetails.getAuthorities().stream()
                .anyMatch(a -> "ROLE_ADMIN".equals(a.getAuthority())
                        || "ROLE_SUPPORT_AGENT".equals(a.getAuthority()));
        if (!isStaff && !ticket.getCustomer().getId().equals(user.getId())) {
            throw new AccessDeniedException("You do not have access to this ticket");
        }
        return ResponseEntity.ok(ApiResponse.success("Ticket retrieved", ticket));
    }

    @GetMapping("/tickets/{id}/messages")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<List<SupportMessage>>> getTicketMessages(@PathVariable UUID id) {
        List<SupportMessage> messages = supportService.getTicketMessages(id);
        return ResponseEntity.ok(ApiResponse.success("Messages retrieved", messages));
    }

    @PostMapping("/tickets/{id}/messages")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<SupportMessage>> addMessage(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID id,
            @RequestBody MessageRequest request) {

        SupportTicket ticket = supportService.updateStatus(id, "IN_PROGRESS");
        User user = getCurrentUser(userDetails);
        SupportMessage message = supportService.addMessage(ticket, user, request.getMessage());
        return ResponseEntity.ok(ApiResponse.success("Message added", message));
    }

    @PatchMapping("/tickets/{id}/close")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<SupportTicket>> closeTicket(@PathVariable UUID id) {
        SupportTicket ticket = supportService.updateStatus(id, "CLOSED");
        return ResponseEntity.ok(ApiResponse.success("Ticket closed", ticket));
    }

    @PostMapping("/tickets/{id}/survey")
    @PreAuthorize("hasRole('CUSTOMER')")
    public ResponseEntity<ApiResponse<Object>> submitSurvey(
            @PathVariable UUID id,
            @RequestBody SurveyRequest request) {
        supportService.submitSurvey(id, request.getRating(), request.getFeedback());
        return ResponseEntity.ok(ApiResponse.success("Survey submitted", null));
    }

    private User getCurrentUser(UserDetailsImpl userDetails) {
        return userRepository.findByEmail(userDetails.getEmail())
                .orElseThrow(() -> new ResourceNotFoundException("Logged user not found"));
    }
}
