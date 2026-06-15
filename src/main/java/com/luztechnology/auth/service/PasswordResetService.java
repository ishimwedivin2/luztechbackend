package com.luztechnology.auth.service;

import com.luztechnology.auth.entity.PasswordResetToken;
import com.luztechnology.auth.repository.PasswordResetTokenRepository;
import com.luztechnology.notification.service.MailService;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Instant;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class PasswordResetService {

    private final PasswordResetTokenRepository passwordResetTokenRepository;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final MailService mailService;

    @Value("${app.password-reset.expiration-minutes:30}")
    private long passwordResetExpirationMinutes;

    @Value("${app.password-reset.url:http://localhost:5173/reset-password}")
    private String passwordResetUrl;

    @Transactional
    public void requestPasswordReset(String email) {
        userRepository.findByEmail(email).ifPresent(user -> {
            passwordResetTokenRepository.deleteByUserAndUsedFalse(user);

            String token = UUID.randomUUID().toString();
            PasswordResetToken passwordResetToken = PasswordResetToken.builder()
                    .user(user)
                    .token(token)
                    .expiryDate(Instant.now().plusSeconds(passwordResetExpirationMinutes * 60))
                    .used(false)
                    .build();
            passwordResetTokenRepository.save(passwordResetToken);

            String resetLink = passwordResetUrl + "?token=" + token;
            mailService.sendEmail(
                    user.getEmail(),
                    "Reset your Luz Technology password",
                    "password-reset",
                    Map.of(
                            "name", user.getFirstName(),
                            "resetLink", resetLink,
                            "token", token,
                            "expirationMinutes", passwordResetExpirationMinutes
                    )
            );
        });
    }

    @Transactional
    public void resetPassword(String token, String newPassword) {
        PasswordResetToken passwordResetToken = passwordResetTokenRepository.findByToken(token)
                .orElseThrow(() -> new IllegalArgumentException("Invalid password reset token"));

        if (passwordResetToken.isUsed()) {
            throw new IllegalArgumentException("Password reset token has already been used");
        }

        if (passwordResetToken.getExpiryDate().isBefore(Instant.now())) {
            throw new IllegalArgumentException("Password reset token has expired");
        }

        User user = passwordResetToken.getUser();
        user.setPassword(passwordEncoder.encode(newPassword));
        user.setForcePasswordChange(false);
        userRepository.save(user);

        passwordResetToken.setUsed(true);
        passwordResetTokenRepository.save(passwordResetToken);
    }
}
