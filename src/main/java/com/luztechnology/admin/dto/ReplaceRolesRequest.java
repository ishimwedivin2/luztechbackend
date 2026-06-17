package com.luztechnology.admin.dto;

import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

import java.util.Set;

@Data
public class ReplaceRolesRequest {
    @NotEmpty
    private Set<String> roleNames;
}
