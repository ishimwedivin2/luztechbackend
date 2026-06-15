package com.luztechnology.support.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.UUID;

@Data
public class ChatSocketMessageRequest {
    @NotNull
    private UUID senderId;

    @NotBlank
    private String message;
}
