package com.luztechnology.support.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.support.dto.FaqArticleRequest;
import com.luztechnology.support.entity.FaqArticle;
import com.luztechnology.support.service.FaqService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/support/knowledge-base/faqs")
@RequiredArgsConstructor
public class FaqController {

    private final FaqService faqService;

    @GetMapping
    public ResponseEntity<ApiResponse<List<FaqArticle>>> getPublishedArticles(@RequestParam(required = false) String category) {
        return ResponseEntity.ok(ApiResponse.success("FAQ articles retrieved", faqService.getPublishedArticles(category)));
    }

    @GetMapping("/admin")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<List<FaqArticle>>> getAllArticles() {
        return ResponseEntity.ok(ApiResponse.success("FAQ articles retrieved", faqService.getAllArticles()));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse<FaqArticle>> getArticle(@PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("FAQ article retrieved", faqService.getPublishedArticle(id)));
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<FaqArticle>> createArticle(@Valid @RequestBody FaqArticleRequest request) {
        return ResponseEntity.ok(ApiResponse.success("FAQ article created", faqService.createArticle(request)));
    }

    @PutMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<FaqArticle>> updateArticle(
            @PathVariable UUID id,
            @Valid @RequestBody FaqArticleRequest request) {
        return ResponseEntity.ok(ApiResponse.success("FAQ article updated", faqService.updateArticle(id, request)));
    }

    @DeleteMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN', 'SUPPORT_AGENT')")
    public ResponseEntity<ApiResponse<Object>> deleteArticle(@PathVariable UUID id) {
        faqService.deleteArticle(id);
        return ResponseEntity.ok(ApiResponse.success("FAQ article deleted", null));
    }
}
