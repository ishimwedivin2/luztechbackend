package com.luztechnology.auth.repository;

import com.luztechnology.auth.entity.MfaOtp;
import com.luztechnology.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface MfaOtpRepository extends JpaRepository<MfaOtp, UUID> {
    Optional<MfaOtp> findByMfaToken(String mfaToken);
    void deleteByUserAndUsedFalse(User user);
}
