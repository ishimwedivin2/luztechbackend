package com.luztechnology.user.repository;

import com.luztechnology.user.entity.CustomerAddress;
import com.luztechnology.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface CustomerAddressRepository extends JpaRepository<CustomerAddress, UUID> {
    List<CustomerAddress> findByCustomerOrderByDefaultAddressDescCreatedAtDesc(User customer);
    Optional<CustomerAddress> findByIdAndCustomer(UUID id, User customer);
    long countByCustomer(User customer);
}
