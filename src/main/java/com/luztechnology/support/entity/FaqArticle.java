package com.luztechnology.support.entity;

import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "faq_articles")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FaqArticle extends BaseEntity {

    @Column(nullable = false)
    private String question;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String answer;

    @Column(nullable = false)
    private String category;

    @Column(nullable = false)
    @Builder.Default
    private boolean published = true;
}
