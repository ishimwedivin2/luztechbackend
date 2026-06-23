package com.luztechnology.user.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.luztechnology.common.entity.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "users")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class User extends BaseEntity {

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = true)
    private String password; // Nullable for OAuth2 users

    @Column(nullable = false)
    private String firstName;

    @Column(nullable = false)
    private String lastName;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "user_roles", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    @Builder.Default
    private Set<Role> roles = new HashSet<>();

    @Builder.Default
    @Column(nullable = false)
    private boolean emailVerified = false;

    @Builder.Default
    @Column(nullable = false)
    private boolean locked = false;

    @Builder.Default
    @Column(nullable = false)
    private boolean enabled = true;

    @Column(name = "last_login_date")
    private LocalDateTime lastLoginDate;

    @Builder.Default
    @Column(nullable = false)
    private boolean forcePasswordChange = false;

    private String phoneNumber;
    private String address;
}
