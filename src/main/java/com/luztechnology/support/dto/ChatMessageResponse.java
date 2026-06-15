package com.luztechnology.support.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@Builder
public class ChatMessageResponse {
    private UUID id;
    private UUID sessionId;
    private UUID senderId;
    private String senderEmail;
    private String message;
    private LocalDateTime sentAt;
}
