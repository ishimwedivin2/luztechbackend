package com.luztechnology.auth.entity;

import com.luztechnology.common.entity.BaseEntity;
import com.luztechnology.user.entity.User;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.Instant;

@Entity
@Table(name = "mfa_otps")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MfaOtp extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(nullable = false, unique = true)
    private String mfaToken;

    @Column(nullable = false)
    private String codeHash;

    @Column(nullable = false)
    private Instant expiryDate;

    @Builder.Default
    @Column(nullable = false)
    private boolean used = false;
}
