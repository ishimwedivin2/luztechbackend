package com.luztechnology.auth.service;

import com.luztechnology.auth.entity.MfaOtp;
import com.luztechnology.auth.repository.MfaOtpRepository;
import com.luztechnology.notification.service.MailService;
import com.luztechnology.user.entity.User;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.SecureRandom;
import java.time.Instant;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class MfaService {

    private static final SecureRandom SECURE_RANDOM = new SecureRandom();

    private final MfaOtpRepository mfaOtpRepository;
    private final PasswordEncoder passwordEncoder;
    private final MailService mailService;

    @Value("${app.mfa.expiration-minutes:10}")
    private long mfaExpirationMinutes;

    @Transactional
    public String createAndSendOtp(User user) {
        mfaOtpRepository.deleteByUserAndUsedFalse(user);

        String code = String.format("%06d", SECURE_RANDOM.nextInt(1_000_000));
        String mfaToken = UUID.randomUUID().toString();

        MfaOtp otp = MfaOtp.builder()
                .user(user)
                .mfaToken(mfaToken)
                .codeHash(passwordEncoder.encode(code))
                .expiryDate(Instant.now().plusSeconds(mfaExpirationMinutes * 60))
                .used(false)
                .build();
        mfaOtpRepository.save(otp);

        mailService.sendEmail(
                user.getEmail(),
                "Your Luz Technology login verification code",
                "mfa-otp",
                Map.of(
                        "name", user.getFirstName(),
                        "code", code,
                        "expirationMinutes", mfaExpirationMinutes
                )
        );

        return mfaToken;
    }

    @Transactional
    public User verifyOtp(String mfaToken, String code) {
        MfaOtp otp = mfaOtpRepository.findByMfaToken(mfaToken)
                .orElseThrow(() -> new IllegalArgumentException("Invalid MFA token"));

        if (otp.isUsed()) {
            throw new IllegalArgumentException("MFA code has already been used");
        }

        if (otp.getExpiryDate().isBefore(Instant.now())) {
            throw new IllegalArgumentException("MFA code has expired");
        }

        if (!passwordEncoder.matches(code, otp.getCodeHash())) {
            throw new IllegalArgumentException("Invalid MFA code");
        }

        otp.setUsed(true);
        mfaOtpRepository.save(otp);
        return otp.getUser();
    }
}
