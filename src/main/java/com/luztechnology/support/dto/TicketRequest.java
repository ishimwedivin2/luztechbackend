package com.luztechnology.support.dto;

import lombok.Data;

@Data
public class TicketRequest {
    private String title;
    private String description;
    private String priority;
}
