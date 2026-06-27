package com.luztechnology.support.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.security.services.UserDetailsImpl;
import com.luztechnology.support.dto.AssignChatRequest;
import com.luztechnology.support.dto.ChatMessageRequest;
import com.luztechnology.support.dto.ChatMessageResponse;
import com.luztechnology.support.dto.ChatSessionRequest;
import com.luztechnology.support.entity.ChatSession;
import com.luztechnology.support.service.LiveChatService;
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
@RequestMapping("/api/support/live-chat")
@RequiredArgsConstructor
public class LiveChatController {

    private final LiveChatService liveChatService;
    private final UserRepository userRepository;

    @GetMapping("/sessions")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT', 'EMPLOYEE')")
    public ResponseEntity<ApiResponse<List<ChatSession>>> getSessions(
            @RequestParam(required = false) String status) {
        return ResponseEntity.ok(ApiResponse.success(liveChatService.getSessions(status)));
    }

    @GetMapping("/sessions/my")
    @PreAuthorize("hasRole('CUSTOMER')")
    public ResponseEntity<ApiResponse<List<ChatSession>>> getMySessions(
            @AuthenticationPrincipal UserDetailsImpl userDetails) {
        return ResponseEntity.ok(ApiResponse.success(liveChatService.getCustomerSessions(userDetails.getId())));
    }

    @PostMapping("/sessions")
    @PreAuthorize("hasRole('CUSTOMER')")
    public ResponseEntity<ApiResponse<ChatSession>> createSession(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @Valid @RequestBody ChatSessionRequest request) {
        ChatSession session = liveChatService.createSession(
                getCurrentUser(userDetails),
                request.getSubject(),
                request.getOpeningMessage());
        return ResponseEntity.ok(ApiResponse.success("Live chat session created", session));
    }

    @PostMapping("/sessions/{sessionId}/assign")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<ChatSession>> assignSession(
            @PathVariable UUID sessionId,
            @Valid @RequestBody AssignChatRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Chat session assigned",
                liveChatService.assignSession(sessionId, request.getAgentId())));
    }

    @GetMapping("/sessions/{sessionId}/messages")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT', 'EMPLOYEE', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<List<ChatMessageResponse>>> getMessages(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID sessionId) {
        return ResponseEntity.ok(ApiResponse.success(liveChatService.getMessages(sessionId, getCurrentUser(userDetails))));
    }

    @PostMapping("/sessions/{sessionId}/messages")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT', 'EMPLOYEE', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<ChatMessageResponse>> sendMessage(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID sessionId,
            @Valid @RequestBody ChatMessageRequest request) {
        ChatMessageResponse message = liveChatService.sendMessage(sessionId, getCurrentUser(userDetails), request.getMessage());
        return ResponseEntity.ok(ApiResponse.success("Message sent", message));
    }

    @PostMapping("/sessions/{sessionId}/close")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT', 'CUSTOMER')")
    public ResponseEntity<ApiResponse<ChatSession>> closeSession(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID sessionId) {
        return ResponseEntity.ok(ApiResponse.success("Chat session closed",
                liveChatService.closeSession(sessionId, getCurrentUser(userDetails))));
    }

    private User getCurrentUser(UserDetailsImpl userDetails) {
        return userRepository.findByEmail(userDetails.getEmail())
                .orElseThrow(() -> new ResourceNotFoundException("Logged user not found"));
    }
}
