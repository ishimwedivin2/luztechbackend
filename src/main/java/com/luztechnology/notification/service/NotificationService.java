package com.luztechnology.notification.service;

import com.luztechnology.notification.entity.Notification;
import com.luztechnology.notification.repository.NotificationRepository;
import com.luztechnology.user.entity.User;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class NotificationService {

    private final SimpMessagingTemplate messagingTemplate;
    private final NotificationRepository notificationRepository;

    public void sendLiveNotification(String topic, Object message) {
        messagingTemplate.convertAndSend("/topic/" + topic, message);
    }

    @Transactional
    public Notification createNotification(User user, String title, String message, String type, String relatedId) {
        Notification notification = Notification.builder()
                .user(user)
                .title(title)
                .message(message)
                .type(type)
                .relatedId(relatedId)
                .build();
        
        Notification saved = notificationRepository.save(notification);
        
        // Also send live update via WebSocket
        messagingTemplate.convertAndSendToUser(user.getEmail(), "/topic/notifications", saved);
        
        return saved;
    }

    public void sendOrderStatusUpdate(User user, UUID orderId, String status) {
        String title = "Order Update";
        String message = "Your order #" + orderId.toString().substring(0, 8) + " is now " + status;
        createNotification(user, title, message, "ORDER", orderId.toString());
    }

    @Transactional
    public void markAsRead(UUID notificationId) {
        notificationRepository.findById(notificationId).ifPresent(n -> {
            n.setRead(true);
            notificationRepository.save(n);
        });
    }

    @Transactional
    public void markAllAsRead(User user) {
        List<Notification> unread = notificationRepository.findByUserOrderByCreatedAtDesc(user)
                .stream().filter(n -> !n.isRead()).toList();
        unread.forEach(n -> n.setRead(true));
        notificationRepository.saveAll(unread);
    }
}
