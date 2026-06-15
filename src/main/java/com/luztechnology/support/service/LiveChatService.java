package com.luztechnology.support.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.support.dto.ChatMessageResponse;
import com.luztechnology.support.entity.ChatMessage;
import com.luztechnology.support.entity.ChatSession;
import com.luztechnology.support.repository.ChatMessageRepository;
import com.luztechnology.support.repository.ChatSessionRepository;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class LiveChatService {

    private static final String OPEN = "OPEN";
    private static final String ASSIGNED = "ASSIGNED";
    private static final String CLOSED = "CLOSED";

    private final ChatSessionRepository chatSessionRepository;
    private final ChatMessageRepository chatMessageRepository;
    private final UserRepository userRepository;
    private final SimpMessagingTemplate messagingTemplate;

    @Transactional(readOnly = true)
    public List<ChatSession> getSessions(String status) {
        if (status == null) {
            return chatSessionRepository.findAll();
        }
        return chatSessionRepository.findByStatus(status.toUpperCase());
    }

    @Transactional(readOnly = true)
    public List<ChatSession> getCustomerSessions(UUID customerId) {
        return chatSessionRepository.findByCustomerIdOrderByCreatedAtDesc(customerId);
    }

    @Transactional(readOnly = true)
    public ChatSession getSession(UUID sessionId) {
        return chatSessionRepository.findById(sessionId)
                .orElseThrow(() -> new ResourceNotFoundException("Chat session not found with id: " + sessionId));
    }

    @Transactional(readOnly = true)
    public List<ChatMessageResponse> getMessages(UUID sessionId) {
        getSession(sessionId);
        return chatMessageRepository.findBySessionIdOrderByCreatedAtAsc(sessionId).stream()
                .map(this::toResponse)
                .toList();
    }

    @Transactional
    public ChatSession createSession(User customer, String subject, String openingMessage) {
        ChatSession session = ChatSession.builder()
                .customer(customer)
                .subject(subject)
                .status(OPEN)
                .build();
        ChatSession savedSession = chatSessionRepository.save(session);

        if (openingMessage != null && !openingMessage.isBlank()) {
            sendMessage(savedSession.getId(), customer, openingMessage);
        }

        return savedSession;
    }

    @Transactional
    public ChatSession assignSession(UUID sessionId, UUID agentId) {
        ChatSession session = getSession(sessionId);
        User agent = userRepository.findById(agentId)
                .orElseThrow(() -> new ResourceNotFoundException("Agent not found with id: " + agentId));
        session.setAgent(agent);
        session.setStatus(ASSIGNED);
        ChatSession savedSession = chatSessionRepository.save(session);
        messagingTemplate.convertAndSend("/topic/live-chat/sessions", savedSession);
        return savedSession;
    }

    @Transactional
    public ChatMessageResponse sendMessage(UUID sessionId, User sender, String message) {
        ChatSession session = getSession(sessionId);
        if (CLOSED.equalsIgnoreCase(session.getStatus())) {
            throw new IllegalStateException("Cannot send messages to a closed chat session");
        }

        ChatMessage chatMessage = ChatMessage.builder()
                .session(session)
                .sender(sender)
                .message(message)
                .build();
        ChatMessageResponse response = toResponse(chatMessageRepository.save(chatMessage));
        messagingTemplate.convertAndSend("/topic/live-chat/" + sessionId, response);
        return response;
    }

    @Transactional
    public ChatMessageResponse sendSocketMessage(UUID sessionId, UUID senderId, String message) {
        User sender = userRepository.findById(senderId)
                .orElseThrow(() -> new ResourceNotFoundException("Sender not found with id: " + senderId));
        return sendMessage(sessionId, sender, message);
    }

    @Transactional
    public ChatSession closeSession(UUID sessionId) {
        ChatSession session = getSession(sessionId);
        session.setStatus(CLOSED);
        ChatSession savedSession = chatSessionRepository.save(session);
        messagingTemplate.convertAndSend("/topic/live-chat/sessions", savedSession);
        return savedSession;
    }

    private ChatMessageResponse toResponse(ChatMessage message) {
        return ChatMessageResponse.builder()
                .id(message.getId())
                .sessionId(message.getSession().getId())
                .senderId(message.getSender().getId())
                .senderEmail(message.getSender().getEmail())
                .message(message.getMessage())
                .sentAt(message.getCreatedAt())
                .build();
    }
}
