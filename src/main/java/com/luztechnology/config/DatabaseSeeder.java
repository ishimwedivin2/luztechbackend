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
        seedUser("Divin", "Ishimwe",  "ishimwedivin2@gmail.com",   "Admin@123",   "ROLE_ADMIN");
        seedUser("Divin", "Ishimwe",  "ishimwedivin01@gmail.com",  "Employee@123","ROLE_EMPLOYEE");
        seedUser("Divin", "Ishimwe",  "ishimdivin2019@gmail.com",  "Customer@123","ROLE_CUSTOMER");
        seedUser("Divin", "Ishimwe",  "idivin44@gmail.com",        "Support@123", "ROLE_SUPPORT_AGENT");
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

    private void seedUser(String firstName, String lastName, String email, String password, String roleName) {
        if (userRepository.findByEmail(email).isEmpty()) {
            Role role = roleRepository.findByName(roleName)
                    .orElseThrow(() -> new RuntimeException(roleName + " role not found"));

            Set<Role> roles = new HashSet<>();
            roles.add(role);

            User user = User.builder()
                    .firstName(firstName)
                    .lastName(lastName)
                    .email(email)
                    .password(passwordEncoder.encode(password))
                    .roles(roles)
                    .provider("LOCAL")
                    .emailVerified(true)
                    .forcePasswordChange(false)
                    .build();

            userRepository.save(user);
            logger.info("Seeded user: {} | Role: {}", email, roleName);
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
