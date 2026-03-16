package com.luztechnology.admin.aspect;

import com.luztechnology.admin.entity.AuditLog;
import com.luztechnology.admin.repository.AuditLogRepository;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.time.LocalDateTime;

@Aspect
@Component
@RequiredArgsConstructor
public class AuditAspect {

    private static final Logger logger = LoggerFactory.getLogger(AuditAspect.class);
    private final AuditLogRepository auditLogRepository;

    @Pointcut("within(com.luztechnology.auth.controller.AuthController) || " +
              "within(com.luztechnology.order.controller.OrderController) || " +
              "within(com.luztechnology.payment.controller.PaymentWebhookController) || " +
              "within(com.luztechnology.admin.controller.AdminController)")
    public void auditedControllers() {}

    @AfterReturning("auditedControllers()")
    public void logAfterExecution(JoinPoint joinPoint) {
        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            String username = (auth != null && auth.isAuthenticated()) ? auth.getName() : "ANONYMOUS";
            
            String action = joinPoint.getSignature().getName();
            String resource = joinPoint.getSignature().getDeclaringTypeName();

            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
            String ipAddress = request.getRemoteAddr();

            AuditLog logEntry = AuditLog.builder()
                    .userEmail(username)
                    .action(action)
                    .resource(resource)
                    .ipAddress(ipAddress)
                    .status("SUCCESS")
                    .timestamp(LocalDateTime.now())
                    .build();

            auditLogRepository.save(logEntry);
            logger.debug("Audit Log saved: User {} executed {}", username, action);

        } catch (Exception e) {
            logger.error("Failed to save audit log", e);
        }
    }
}
