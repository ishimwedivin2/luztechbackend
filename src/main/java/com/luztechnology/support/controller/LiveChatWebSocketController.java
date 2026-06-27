package com.luztechnology.support.controller;

import com.luztechnology.support.dto.ChatMessageResponse;
import com.luztechnology.support.dto.ChatSocketMessageRequest;
import com.luztechnology.support.service.LiveChatService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;

import java.security.Principal;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class LiveChatWebSocketController {

    private final LiveChatService liveChatService;

    @MessageMapping("/live-chat/{sessionId}/send")
    public ChatMessageResponse sendMessage(
            @DestinationVariable UUID sessionId,
            @Valid ChatSocketMessageRequest request,
            Principal principal) {
        if (principal == null) {
            throw new IllegalStateException("Unauthenticated WebSocket connection");
        }
        return liveChatService.sendSocketMessage(sessionId, principal.getName(), request.getMessage());
    }
}
