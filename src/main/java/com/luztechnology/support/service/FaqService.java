package com.luztechnology.support.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.support.dto.FaqArticleRequest;
import com.luztechnology.support.entity.FaqArticle;
import com.luztechnology.support.repository.FaqArticleRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class FaqService {

    private final FaqArticleRepository faqArticleRepository;

    @Transactional(readOnly = true)
    public List<FaqArticle> getPublishedArticles(String category) {
        if (category == null || category.isBlank()) {
            return faqArticleRepository.findByPublishedTrue();
        }
        return faqArticleRepository.findByCategoryIgnoreCaseAndPublishedTrue(category);
    }

    @Transactional(readOnly = true)
    public List<FaqArticle> getAllArticles() {
        return faqArticleRepository.findAll();
    }

    @Transactional(readOnly = true)
    public FaqArticle getArticle(UUID id) {
        return faqArticleRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("FAQ article not found"));
    }

    @Transactional(readOnly = true)
    public FaqArticle getPublishedArticle(UUID id) {
        FaqArticle article = getArticle(id);
        if (!article.isPublished()) {
            throw new ResourceNotFoundException("FAQ article not found");
        }
        return article;
    }

    @Transactional
    public FaqArticle createArticle(FaqArticleRequest request) {
        FaqArticle article = FaqArticle.builder()
                .question(request.getQuestion())
                .answer(request.getAnswer())
                .category(request.getCategory())
                .published(request.isPublished())
                .build();
        return faqArticleRepository.save(article);
    }

    @Transactional
    public FaqArticle updateArticle(UUID id, FaqArticleRequest request) {
        FaqArticle article = getArticle(id);
        article.setQuestion(request.getQuestion());
        article.setAnswer(request.getAnswer());
        article.setCategory(request.getCategory());
        article.setPublished(request.isPublished());
        return faqArticleRepository.save(article);
    }

    @Transactional
    public void deleteArticle(UUID id) {
        FaqArticle article = getArticle(id);
        faqArticleRepository.delete(article);
    }
}
