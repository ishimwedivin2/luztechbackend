package com.luztechnology.support.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.UUID;

@Data
@Builder
public class SupportMessageResponse {
    private UUID id;
    private UUID ticketId;
    private UUID senderId;
    private String senderFirstName;
    private String senderEmail;
    private String message;
    private LocalDateTime createdAt;
}
