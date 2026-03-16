package com.luztechnology.auth.dto;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class AuthResponse {
    private String token;
    @Builder.Default
    private String type = "Bearer";
    private String refreshToken;
    private String id;
    private String email;
    private String firstName;
    private String lastName;
    private List<String> roles;
}
