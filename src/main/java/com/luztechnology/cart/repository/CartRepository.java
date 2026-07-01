package com.luztechnology.cart.repository;

import com.luztechnology.cart.entity.Cart;
import com.luztechnology.user.entity.User;
import jakarta.persistence.LockModeType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface CartRepository extends JpaRepository<Cart, UUID> {
    @Lock(LockModeType.PESSIMISTIC_WRITE)
    Optional<Cart> findByUser(User user);
}
