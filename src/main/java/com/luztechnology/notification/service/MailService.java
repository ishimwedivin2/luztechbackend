package com.luztechnology.notification.service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MailService {

    private static final Logger logger = LoggerFactory.getLogger(MailService.class);
    private final JavaMailSender javaMailSender;
    private final TemplateEngine templateEngine;

    @org.springframework.beans.factory.annotation.Value("${spring.mail.username}")
    private String senderEmail;

    public void sendEmail(String to, String subject, String templateName, Map<String, Object> templateModel) {
        try {
            Context thymeleafContext = new Context();
            thymeleafContext.setVariables(templateModel);

            String htmlBody = templateEngine.process(templateName, thymeleafContext);

            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setFrom(senderEmail, "Luz Technology");
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(htmlBody, true);
            addLogoInline(helper);

            javaMailSender.send(message);
            logger.info("Email sent successfully to: {}", to);

        } catch (MessagingException e) {
            logger.error("Failed to send email to {}: {}", to, e.getMessage(), e);
            throw new IllegalStateException("Failed to send email", e);
        } catch (java.io.UnsupportedEncodingException e) {
            logger.error("Failed to set sender name for email to {}: {}", to, e.getMessage(), e);
            throw new IllegalStateException("Failed to send email", e);
        } catch (Exception e) {
            logger.error("Unexpected error sending email to {}: {}", to, e.getMessage(), e);
            throw new IllegalStateException("Failed to send email", e);
        }
    }

    private void addLogoInline(MimeMessageHelper helper) {
        for (String candidate : new String[] {
                "../ecommerce/public/logo.jpg",
                "ecommerce/public/logo.jpg",
                "src/main/resources/static/logo.jpg"
        }) {
            Path logoPath = Path.of(candidate).toAbsolutePath().normalize();
            if (Files.exists(logoPath)) {
                try {
                    helper.addInline("logo", new FileSystemResource(logoPath), "image/jpeg");
                } catch (MessagingException e) {
                    logger.warn("Could not attach email logo {}: {}", logoPath, e.getMessage());
                }
                return;
            }
        }
        logger.warn("Email logo.jpg was not found; templates will fall back to text branding");
    }
}
