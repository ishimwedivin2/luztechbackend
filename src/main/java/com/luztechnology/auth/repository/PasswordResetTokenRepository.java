package com.luztechnology.auth.repository;

import com.luztechnology.auth.entity.PasswordResetToken;
import com.luztechnology.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface PasswordResetTokenRepository extends JpaRepository<PasswordResetToken, UUID> {
    Optional<PasswordResetToken> findByToken(String token);
    void deleteByUserAndUsedFalse(User user);
}
