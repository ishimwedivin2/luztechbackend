package com.luztechnology.support.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class ChatSessionRequest {
    @NotBlank
    private String subject;

    private String openingMessage;
}
