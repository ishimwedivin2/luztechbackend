package com.luztechnology.auth.controller;

import com.luztechnology.admin.entity.SecuritySettings;
import com.luztechnology.admin.service.SecuritySettingsService;
import com.luztechnology.auth.dto.*;
import com.luztechnology.auth.entity.RefreshToken;
import com.luztechnology.auth.entity.LoginAttempt;
import com.luztechnology.auth.repository.LoginAttemptRepository;
import com.luztechnology.auth.service.MfaService;
import com.luztechnology.auth.service.PasswordResetService;
import com.luztechnology.auth.service.RefreshTokenService;
import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.security.jwt.JwtUtils;
import com.luztechnology.security.services.UserDetailsImpl;
import com.luztechnology.user.entity.Role;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.RoleRepository;
import com.luztechnology.user.repository.UserRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {
    private final AuthenticationManager authenticationManager;
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder encoder;
    private final JwtUtils jwtUtils;
    private final RefreshTokenService refreshTokenService;
    private final PasswordResetService passwordResetService;
    private final MfaService mfaService;
    private final SecuritySettingsService securitySettingsService;
    private final LoginAttemptRepository loginAttemptRepository;

    @PostMapping("/login")
    public ResponseEntity<ApiResponse<AuthResponse>> authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {
        SecuritySettings settings = securitySettingsService.getSettings();
        User existingUser = userRepository.findByEmail(loginRequest.getEmail()).orElse(null);
        if (existingUser != null && existingUser.isLocked()) {
            throw new IllegalStateException("User account is locked. Contact an administrator.");
        }

        Authentication authentication;
        try {
            authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(loginRequest.getEmail(), loginRequest.getPassword()));
        } catch (RuntimeException ex) {
            recordLoginAttempt(loginRequest.getEmail(), false, ex.getMessage());
            lockUserIfThresholdReached(loginRequest.getEmail(), settings);
            throw new IllegalArgumentException("Invalid email or password");
        }

        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        User user = userRepository.findById(userDetails.getId()).orElseThrow();
        recordLoginAttempt(user.getEmail(), true, null);
        user.setLastLoginDate(LocalDateTime.now());
        userRepository.save(user);

        if (!settings.isMfaRequired()) {
            AuthResponse authResponse = buildAuthResponse(user);
            return ResponseEntity.ok(ApiResponse.success("User logged in successfully", authResponse));
        }

        String mfaToken = mfaService.createAndSendOtp(user);

        AuthResponse mfaResponse = AuthResponse.builder()
                .id(userDetails.getId().toString())
                .email(userDetails.getEmail())
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .roles(getRolesFromAuthentication(authentication))
                .mfaRequired(true)
                .mfaToken(mfaToken)
                .build();

        SecurityContextHolder.clearContext();
        return ResponseEntity.ok(ApiResponse.success("MFA verification required", mfaResponse));
    }

    @PostMapping("/register")
    public ResponseEntity<ApiResponse<String>> registerUser(@Valid @RequestBody RegisterRequest signUpRequest) {
        if (userRepository.existsByEmail(signUpRequest.getEmail())) {
            return ResponseEntity
                    .badRequest()
                    .body(ApiResponse.error("Error: Email is already in use!"));
        }
        securitySettingsService.validatePassword(signUpRequest.getPassword());

        User user = User.builder()
                .firstName(signUpRequest.getFirstName())
                .lastName(signUpRequest.getLastName())
                .email(signUpRequest.getEmail())
                .password(encoder.encode(signUpRequest.getPassword()))
                .enabled(true)
                .emailVerified(false)
                .provider("LOCAL")
                .build();

        Role userRole = roleRepository.findByName("ROLE_CUSTOMER")
                .orElseThrow(() -> new RuntimeException("Error: Role is not found."));
        user.setRoles(Set.of(userRole));

        userRepository.save(user);

        return ResponseEntity.ok(ApiResponse.success("User registered successfully!", null));
    }

    @PostMapping("/forgot-password")
    public ResponseEntity<ApiResponse<String>> forgotPassword(
            @Valid @RequestBody ForgotPasswordRequest forgotPasswordRequest) {
        passwordResetService.requestPasswordReset(forgotPasswordRequest.getEmail());
        return ResponseEntity.ok(ApiResponse.success(
                "If an account exists for this email, a password reset link has been sent.",
                null));
    }

    @PostMapping("/reset-password")
    public ResponseEntity<ApiResponse<String>> resetPassword(
            @Valid @RequestBody ResetPasswordRequest resetPasswordRequest) {
        passwordResetService.resetPassword(
                resetPasswordRequest.getToken(),
                resetPasswordRequest.getNewPassword());
        return ResponseEntity.ok(ApiResponse.success("Password reset successfully", null));
    }

    @PostMapping("/mfa/verify")
    public ResponseEntity<ApiResponse<AuthResponse>> verifyMfa(
            @Valid @RequestBody MfaVerificationRequest mfaVerificationRequest) {
        User user = mfaService.verifyOtp(
                mfaVerificationRequest.getMfaToken(),
                mfaVerificationRequest.getCode());

        AuthResponse authResponse = buildAuthResponse(user);
        return ResponseEntity.ok(ApiResponse.success("User logged in successfully", authResponse));
    }

    @PostMapping("/refresh")
    public ResponseEntity<ApiResponse<TokenRefreshResponse>> refreshtoken(@Valid @RequestBody TokenRefreshRequest request) {
        String requestRefreshToken = request.getRefreshToken();

        return refreshTokenService.findByToken(requestRefreshToken)
                .map(refreshTokenService::verifyExpiration)
                .map(RefreshToken::getUser)
                .map(user -> {
                    String token = jwtUtils.generateTokenFromEmail(user.getEmail());
                    return ResponseEntity.ok(ApiResponse.success(new TokenRefreshResponse(token, requestRefreshToken)));
                })
                .orElseThrow(() -> new RuntimeException("Refresh token is not in database!"));
    }

    @PostMapping("/logout")
    public ResponseEntity<ApiResponse<String>> logoutUser() {
        UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        refreshTokenService.deleteByUserId(userDetails.getId());
        return ResponseEntity.ok(ApiResponse.success("Log out successful", null));
    }

    private AuthResponse buildAuthResponse(User user) {
        String jwt = jwtUtils.generateTokenFromEmail(user.getEmail());
        RefreshToken refreshToken = refreshTokenService.createRefreshToken(user.getId());

        return AuthResponse.builder()
                .token(jwt)
                .refreshToken(refreshToken.getToken())
                .id(user.getId().toString())
                .email(user.getEmail())
                .firstName(user.getFirstName())
                .lastName(user.getLastName())
                .roles(user.getRoles().stream()
                        .map(Role::getName)
                        .collect(Collectors.toList()))
                .type("Bearer")
                .mfaRequired(false)
                .build();
    }

    private List<String> getRolesFromAuthentication(Authentication authentication) {
        return authentication.getAuthorities().stream()
                .map(item -> item.getAuthority())
                .collect(Collectors.toList());
    }

    private void recordLoginAttempt(String email, boolean success, String failureReason) {
        loginAttemptRepository.save(LoginAttempt.builder()
                .email(email)
                .ipAddress("UNKNOWN")
                .success(success)
                .failureReason(failureReason)
                .build());
    }

    private void lockUserIfThresholdReached(String email, SecuritySettings settings) {
        User user = userRepository.findByEmail(email).orElse(null);
        if (user == null) {
            return;
        }
        LocalDateTime windowStart = LocalDateTime.now().minusMinutes(settings.getLockoutDurationMinutes());
        long failedAttempts = loginAttemptRepository
                .countByEmailIgnoreCaseAndSuccessFalseAndCreatedAtAfter(email, windowStart);
        if (failedAttempts >= settings.getMaxFailedLoginAttempts()) {
            user.setLocked(true);
            userRepository.save(user);
        }
    }
}
