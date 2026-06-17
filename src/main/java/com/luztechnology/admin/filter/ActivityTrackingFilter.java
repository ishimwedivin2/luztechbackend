package com.luztechnology.admin.filter;

import com.luztechnology.admin.entity.AuditLog;
import com.luztechnology.admin.repository.AuditLogRepository;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.time.LocalDateTime;

@Component
@RequiredArgsConstructor
public class ActivityTrackingFilter extends OncePerRequestFilter {

    private final AuditLogRepository auditLogRepository;

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) {
        String path = request.getRequestURI();
        return path.startsWith("/uploads/")
                || path.startsWith("/swagger-ui")
                || path.startsWith("/v3/api-docs")
                || "OPTIONS".equalsIgnoreCase(request.getMethod());
    }

    @Override
    protected void doFilterInternal(
            HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain) throws ServletException, IOException {
        long startedAt = System.currentTimeMillis();
        Exception failure = null;

        try {
            filterChain.doFilter(request, response);
        } catch (Exception ex) {
            failure = ex;
            throw ex;
        } finally {
            saveActivity(request, response, startedAt, failure);
        }
    }

    private void saveActivity(
            HttpServletRequest request,
            HttpServletResponse response,
            long startedAt,
            Exception failure) {
        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String userEmail = auth != null && auth.isAuthenticated() ? auth.getName() : "ANONYMOUS";
            long durationMs = System.currentTimeMillis() - startedAt;

            AuditLog entry = AuditLog.builder()
                    .userEmail(userEmail)
                    .action(request.getMethod())
                    .resource(request.getRequestURI())
                    .ipAddress(request.getRemoteAddr())
                    .details("status=" + response.getStatus()
                            + ", durationMs=" + durationMs
                            + ", userAgent=" + nullToBlank(request.getHeader("User-Agent")))
                    .status(failure == null && response.getStatus() < 400 ? "SUCCESS" : "FAILURE")
                    .timestamp(LocalDateTime.now())
                    .build();
            auditLogRepository.save(entry);
        } catch (Exception ignored) {
            // Activity tracking must never break the business request path.
        }
    }

    private String nullToBlank(String value) {
        return value == null ? "" : value;
    }
}
