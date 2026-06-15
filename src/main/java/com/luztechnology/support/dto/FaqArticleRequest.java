package com.luztechnology.support.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class FaqArticleRequest {

    @NotBlank
    private String question;

    @NotBlank
    private String answer;

    @NotBlank
    private String category;

    private boolean published = true;
}
