package com.luztechnology.user.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.security.services.UserDetailsImpl;
import com.luztechnology.user.dto.CustomerAddressRequest;
import com.luztechnology.user.dto.CustomerAddressResponse;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import com.luztechnology.user.service.CustomerAddressService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/users/addresses")
@RequiredArgsConstructor
@PreAuthorize("hasRole('CUSTOMER')")
public class CustomerAddressController {

    private final CustomerAddressService addressService;
    private final UserRepository userRepository;

    @GetMapping
    public ResponseEntity<ApiResponse<List<CustomerAddressResponse>>> getAddresses(
            @AuthenticationPrincipal UserDetailsImpl userDetails) {
        return ResponseEntity.ok(ApiResponse.success(addressService.getAddresses(getCurrentUser(userDetails))));
    }

    @PostMapping
    public ResponseEntity<ApiResponse<CustomerAddressResponse>> createAddress(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @Valid @RequestBody CustomerAddressRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Address saved",
                addressService.toResponse(addressService.createAddress(getCurrentUser(userDetails), request))));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ApiResponse<CustomerAddressResponse>> updateAddress(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID id,
            @Valid @RequestBody CustomerAddressRequest request) {
        return ResponseEntity.ok(ApiResponse.success("Address updated",
                addressService.updateAddress(getCurrentUser(userDetails), id, request)));
    }

    @PatchMapping("/{id}/default")
    public ResponseEntity<ApiResponse<CustomerAddressResponse>> setDefault(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID id) {
        return ResponseEntity.ok(ApiResponse.success("Default address updated",
                addressService.setDefault(getCurrentUser(userDetails), id)));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse<Void>> deleteAddress(
            @AuthenticationPrincipal UserDetailsImpl userDetails,
            @PathVariable UUID id) {
        addressService.deleteAddress(getCurrentUser(userDetails), id);
        return ResponseEntity.ok(ApiResponse.success("Address deleted", null));
    }

    private User getCurrentUser(UserDetailsImpl userDetails) {
        return userRepository.findByEmail(userDetails.getEmail())
                .orElseThrow(() -> new ResourceNotFoundException("Logged user not found"));
    }
}
