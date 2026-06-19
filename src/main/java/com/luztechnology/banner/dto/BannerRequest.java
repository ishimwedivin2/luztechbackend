package com.luztechnology.banner.dto;

import lombok.*;

import java.util.UUID;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BannerRequest {
    private String title;
    private String subtitle;
    private String imageUrl;
    private String linkUrl;
    private String buttonText;
    private String tagLabel;
    private boolean active;
    private int displayOrder;
    private UUID productId;
}
