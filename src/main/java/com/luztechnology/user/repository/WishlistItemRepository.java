package com.luztechnology.user.repository;

import com.luztechnology.user.entity.User;
import com.luztechnology.user.entity.WishlistItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface WishlistItemRepository extends JpaRepository<WishlistItem, UUID> {
    List<WishlistItem> findByUser(User user);

    void deleteByUserAndProductId(User user, UUID productId);

    boolean existsByUserAndProductId(User user, UUID productId);
}
