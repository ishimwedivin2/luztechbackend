package com.luztechnology.admin.controller;

import com.luztechnology.common.dto.ApiResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/admin/email-templates")
@RequiredArgsConstructor
public class EmailTemplateController {

    private static final Map<String, String> TEMPLATE_META = new LinkedHashMap<>();

    static {
        TEMPLATE_META.put("order-confirmation",  "Order Confirmation — sent to customer after a successful order");
        TEMPLATE_META.put("password-reset",       "Password Reset — sent when a user requests a password reset link");
        TEMPLATE_META.put("mfa-otp",              "MFA OTP — sent with a one-time code for multi-factor authentication");
        TEMPLATE_META.put("low-stock-alert",      "Low Stock Alert — sent to admins when inventory drops below threshold");
    }

    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<List<Map<String, String>>>> listTemplates() {
        List<Map<String, String>> list = TEMPLATE_META.entrySet().stream().map(e -> {
            Map<String, String> m = new LinkedHashMap<>();
            m.put("name",        e.getKey());
            m.put("description", e.getValue());
            m.put("filename",    e.getKey() + ".html");
            return m;
        }).toList();
        return ResponseEntity.ok(ApiResponse.success("Templates listed", list));
    }

    @GetMapping("/{name}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<Map<String, String>>> getTemplate(@PathVariable String name)
            throws IOException {
        if (!TEMPLATE_META.containsKey(name)) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.error("Unknown template: " + name));
        }
        String content = readTemplate(name);
        Map<String, String> result = new LinkedHashMap<>();
        result.put("name",        name);
        result.put("description", TEMPLATE_META.get(name));
        result.put("content",     content);
        return ResponseEntity.ok(ApiResponse.success("Template retrieved", result));
    }

    @PutMapping("/{name}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ApiResponse<String>> updateTemplate(
            @PathVariable String name,
            @RequestBody Map<String, String> body) throws IOException {
        if (!TEMPLATE_META.containsKey(name)) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.error("Unknown template: " + name));
        }
        String content = body.get("content");
        if (content == null || content.isBlank()) {
            return ResponseEntity.badRequest()
                    .body(ApiResponse.error("Content must not be empty"));
        }
        Path path = resolveTemplatePath(name);
        Files.writeString(path, content, StandardCharsets.UTF_8);
        return ResponseEntity.ok(ApiResponse.success("Template updated", name));
    }

    // ── Helpers ───────────────────────────────────────────────

    private String readTemplate(String name) throws IOException {
        // Try classpath resource first (packaged jar), fall back to filesystem path
        try {
            ClassPathResource res = new ClassPathResource("templates/" + name + ".html");
            return new String(res.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
        } catch (IOException e) {
            Path path = resolveTemplatePath(name);
            if (Files.exists(path)) return Files.readString(path, StandardCharsets.UTF_8);
            return "<!-- Template file not found: " + name + ".html -->";
        }
    }

    private Path resolveTemplatePath(String name) {
        return Paths.get("src", "main", "resources", "templates", name + ".html");
    }
}
