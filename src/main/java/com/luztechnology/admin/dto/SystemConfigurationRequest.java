package com.luztechnology.admin.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class SystemConfigurationRequest {
    @NotBlank
    private String configValue;

    private String category;
    private String description;
    private boolean sensitive;
}
