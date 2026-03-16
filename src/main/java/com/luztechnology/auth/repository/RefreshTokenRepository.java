package com.luztechnology.auth.repository;

import com.luztechnology.auth.entity.RefreshToken;
import com.luztechnology.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface RefreshTokenRepository extends JpaRepository<RefreshToken, UUID> {
    Optional<RefreshToken> findByToken(String token);
    int deleteByUser(User user);
    Optional<RefreshToken> findByUser(User user);
    Optional<RefreshToken> findByUserAndRevokedFalse(User user);
}
