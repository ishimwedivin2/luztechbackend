package com.luztechnology.config;

import com.luztechnology.academy.entity.Course;
import com.luztechnology.academy.repository.CourseRepository;
import com.luztechnology.career.entity.JobOpening;
import com.luztechnology.career.repository.JobOpeningRepository;
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
    private final JobOpeningRepository jobOpeningRepository;
    private final CourseRepository courseRepository;

    @Override
    @Transactional
    public void run(String... args) throws Exception {
        seedRoles();
        seedAdminUser();
        seedCareerData();
        seedAcademyData();
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
                    .forcePasswordChange(false) // No longer forced change on first login
                    .build();

            userRepository.save(admin);
            logger.info("Seeded Default Admin User: admin@luztech.com | Password: Admin@123");
        }
    }

    private void seedCareerData() {
        if (jobOpeningRepository.count() == 0) {
            JobOpening itSpecialist = JobOpening.builder()
                    .title("IT Support Specialist")
                    .description("We are looking for a dedicated IT Support Specialist to join our networking team.")
                    .requirements("BSc in Computer Science or equivalent, Knowledge of Cisco Networking.")
                    .location("Kigali, Rwanda")
                    .salaryRange("$800 - $1200")
                    .type(JobOpening.JobType.FULL_TIME)
                    .status(JobOpening.JobStatus.OPEN)
                    .build();

            JobOpening intern = JobOpening.builder()
                    .title("Network Engineer Intern")
                    .description("Join our intensive internship program to learn about enterprise networking.")
                    .requirements("Recent graduate or final year student in IT.")
                    .location("Remote / Hybrid")
                    .salaryRange("Stipend provided")
                    .type(JobOpening.JobType.INTERN)
                    .status(JobOpening.JobStatus.OPEN)
                    .build();

            jobOpeningRepository.saveAll(Arrays.asList(itSpecialist, intern));
            logger.info("Seeded Career initial data");
        }
    }

    private void seedAcademyData() {
        if (courseRepository.count() == 0) {
            Course ccna = Course.builder()
                    .title("CCNA Routing & Switching")
                    .description("Comprehensive training for Cisco Certified Network Associate.")
                    .instructor("Eng. John Doe")
                    .duration("12 Weeks")
                    .price(new java.math.BigDecimal("250.00"))
                    .type(Course.CourseType.TRAINING)
                    .status(Course.CourseStatus.ACTIVE)
                    .build();

            Course internship = Course.builder()
                    .title("Enterprise IT Internship")
                    .description("Practical internship program covering server management and networking.")
                    .instructor("Tech Team")
                    .duration("6 Months")
                    .price(java.math.BigDecimal.ZERO)
                    .type(Course.CourseType.INTERNSHIP)
                    .status(Course.CourseStatus.ACTIVE)
                    .build();

            courseRepository.saveAll(Arrays.asList(ccna, internship));
            logger.info("Seeded Academy initial data");
        }
    }
}
