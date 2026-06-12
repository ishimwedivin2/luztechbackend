package com.luztechnology.config;

import com.luztechnology.user.entity.Role;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.RoleRepository;
import com.luztechnology.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Component
@RequiredArgsConstructor
public class DatabaseSeeder implements CommandLineRunner {

    private static final Logger logger = LoggerFactory.getLogger(DatabaseSeeder.class);

    private final RoleRepository roleRepository;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @Override
    @Transactional
    public void run(String... args) throws Exception {
        seedRoles();
        seedAdminUser();
    }

    private void seedRoles() {
        List<String> roles = Arrays.asList(
                "ROLE_ADMIN",
                "ROLE_EMPLOYEE",
                "ROLE_CUSTOMER",
                "ROLE_SUPPORT_AGENT");

        for (String roleName : roles) {
            if (roleRepository.findByName(roleName).isEmpty()) {
                Role role = new Role();
                role.setName(roleName);
                role.setDescription("Default role: " + roleName);
                roleRepository.save(role);
                logger.info("Seeded Role: {}", roleName);
            }
        }
    }

    private void seedAdminUser() {
        if (userRepository.findByEmail("admin@luztech.com").isEmpty()) {
            Role adminRole = roleRepository.findByName("ROLE_ADMIN")
                    .orElseThrow(() -> new RuntimeException("Admin role not found"));

            Set<Role> roles = new HashSet<>();
            roles.add(adminRole);

            User admin = User.builder()
                    .firstName("System")
                    .lastName("Administrator")
                    .email("admin@luztech.com")
                    .password(passwordEncoder.encode("Admin@123"))
                    .roles(roles)
                    .provider("LOCAL")
                    .emailVerified(true)
                    .forcePasswordChange(false)
                    .build();

            userRepository.save(admin);
            logger.info("Seeded Default Admin User: admin@luztech.com | Password: Admin@123");
        }
    }
}
