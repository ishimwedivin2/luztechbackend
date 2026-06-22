package com.luztechnology.user.controller;

import com.luztechnology.common.dto.ApiResponse;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import com.luztechnology.security.services.UserDetailsImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserRepository userRepository;

    @GetMapping("/profile")
    public ResponseEntity<ApiResponse<User>> getMyProfile() {
        UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        return ResponseEntity.ok(ApiResponse.success(userRepository.findById(userDetails.getId()).orElseThrow()));
    }

    @PutMapping("/profile")
    public ResponseEntity<ApiResponse<User>> updateProfile(@RequestBody User profileUpdate) {
        UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        User user = userRepository.findById(userDetails.getId()).orElseThrow();

        user.setFirstName(profileUpdate.getFirstName());
        user.setLastName(profileUpdate.getLastName());
        user.setPhoneNumber(profileUpdate.getPhoneNumber());
        user.setAddress(profileUpdate.getAddress());

        return ResponseEntity.ok(ApiResponse.success("Profile updated", userRepository.save(user)));
    }

    @DeleteMapping("/account")
    public ResponseEntity<ApiResponse<Void>> deleteAccount(
            @RequestBody(required = false) Map<String, String> body) {
        UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
        User user = userRepository.findById(userDetails.getId()).orElseThrow();

        // Soft-delete: disable and anonymise rather than hard-delete to preserve order history
        user.setEnabled(false);
        user.setLocked(true);
        user.setFirstName("[Deleted]");
        user.setLastName("[Account]");
        user.setPhoneNumber(null);
        user.setAddress(null);
        userRepository.save(user);

        return ResponseEntity.ok(ApiResponse.success("Account deleted successfully", null));
    }
}
