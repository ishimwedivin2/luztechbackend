package com.luztechnology.support.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class ChatSocketMessageRequest {
    @NotBlank
    private String message;
}
