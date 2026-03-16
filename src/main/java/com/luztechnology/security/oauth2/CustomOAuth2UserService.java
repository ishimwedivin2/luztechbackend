package com.luztechnology.security.oauth2;

import com.luztechnology.user.entity.Role;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.RoleRepository;
import com.luztechnology.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class CustomOAuth2UserService extends DefaultOAuth2UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);

        String email = oAuth2User.getAttribute("email");
        String firstName = oAuth2User.getAttribute("given_name");
        String lastName = oAuth2User.getAttribute("family_name");

        Optional<User> userOptional = userRepository.findByEmail(email);

        if (userOptional.isEmpty()) {
            Role userRole = roleRepository.findByName("ROLE_CUSTOMER")
                    .orElseThrow(() -> new RuntimeException("Error: Role is not found."));

            User newUser = User.builder()
                    .email(email)
                    .firstName(firstName != null ? firstName : "User")
                    .lastName(lastName != null ? lastName : "")
                    .provider("GOOGLE")
                    .enabled(true)
                    .emailVerified(true)
                    .roles(Set.of(userRole))
                    .build();

            userRepository.save(newUser);
        } else {
            User existingUser = userOptional.get();
            if (!("GOOGLE".equals(existingUser.getProvider()))) {
                existingUser.setProvider("GOOGLE");
                userRepository.save(existingUser);
            }
        }

        return oAuth2User;
    }
}
