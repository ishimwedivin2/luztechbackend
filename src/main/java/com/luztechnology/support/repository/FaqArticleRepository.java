package com.luztechnology.support.repository;

import com.luztechnology.support.entity.FaqArticle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface FaqArticleRepository extends JpaRepository<FaqArticle, UUID> {
    List<FaqArticle> findByPublishedTrue();

    List<FaqArticle> findByCategoryIgnoreCaseAndPublishedTrue(String category);
}
