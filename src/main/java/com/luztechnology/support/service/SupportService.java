package com.luztechnology.support.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.notification.service.NotificationService;
import com.luztechnology.support.dto.SupportMessageResponse;
import com.luztechnology.support.dto.TicketDetailResponse;
import com.luztechnology.support.entity.SatisfactionSurvey;
import com.luztechnology.support.entity.SupportMessage;
import com.luztechnology.support.entity.SupportTicket;
import com.luztechnology.support.repository.SatisfactionSurveyRepository;
import com.luztechnology.support.repository.SupportMessageRepository;
import com.luztechnology.support.repository.SupportTicketRepository;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class SupportService {

    private final SupportTicketRepository ticketRepository;
    private final SupportMessageRepository messageRepository;
    private final SatisfactionSurveyRepository surveyRepository;
    private final UserRepository userRepository;
    private final NotificationService notificationService;
    private final SimpMessagingTemplate messagingTemplate;

    @Transactional
    public SupportTicket createTicket(User customer, String title, String description, String priority) {
        SupportTicket ticket = SupportTicket.builder()
                .customer(customer)
                .title(title)
                .description(description)
                .status("OPEN")
                .priority(priority != null ? priority : "MEDIUM")
                .build();
        // Fix 1: description is stored on the ticket itself — do NOT also create a duplicate initial message
        return ticketRepository.save(ticket);
    }

    @Transactional
    public SupportMessageResponse addMessage(SupportTicket ticket, User sender, String content) {
        SupportMessage message = SupportMessage.builder()
                .ticket(ticket)
                .sender(sender)
                .message(content)
                .build();

        SupportMessageResponse response = toMessageResponse(messageRepository.save(message));

        // Notify customer if agent/admin replies
        if (sender != null && ticket.getCustomer() != null
                && !sender.getId().equals(ticket.getCustomer().getId())) {
            notificationService.createNotification(
                    ticket.getCustomer(),
                    "Support Update",
                    "There is a new reply on your ticket: " + ticket.getTitle(),
                    "SUPPORT",
                    ticket.getId().toString()
            );
        }

        // Fix 11: broadcast new message in real-time so ticket-detail page updates live
        messagingTemplate.convertAndSend("/topic/tickets/" + ticket.getId(), response);

        return response;
    }

    @Transactional
    public SupportTicket assignTicket(UUID ticketId, UUID agentId) {
        SupportTicket ticket = ticketRepository.findById(ticketId)
                .orElseThrow(() -> new ResourceNotFoundException("Ticket not found"));

        User agent = userRepository.findById(agentId)
                .orElseThrow(() -> new ResourceNotFoundException("Agent not found"));
        boolean canHandleSupport = agent.getRoles().stream()
                .anyMatch(role -> "ROLE_SUPPORT_AGENT".equals(role.getName())
                        || "ROLE_ADMIN".equals(role.getName())
                        || "ROLE_EMPLOYEE".equals(role.getName()));
        if (!canHandleSupport) {
            throw new IllegalArgumentException("Assigned user must be an admin, employee, or support agent");
        }

        ticket.setAssignedAgent(agent);
        ticket.setStatus("IN_PROGRESS");
        SupportTicket saved = ticketRepository.save(ticket);

        notificationService.createNotification(
                ticket.getCustomer(),
                "Support Update",
                "Your ticket has been assigned to an agent: " + agent.getFirstName(),
                "SUPPORT",
                ticket.getId().toString()
        );

        return saved;
    }

    @Transactional
    public SupportTicket updateStatus(UUID ticketId, String status) {
        SupportTicket ticket = ticketRepository.findById(ticketId)
                .orElseThrow(() -> new ResourceNotFoundException("Ticket not found"));
        ticket.setStatus(status);
        return ticketRepository.save(ticket);
    }

    @Transactional
    public SatisfactionSurvey submitSurvey(UUID ticketId, Integer rating, String feedback) {
        SupportTicket ticket = ticketRepository.findById(ticketId)
                .orElseThrow(() -> new ResourceNotFoundException("Ticket not found"));

        if (!"RESOLVED".equals(ticket.getStatus()) && !"CLOSED".equals(ticket.getStatus())) {
            throw new IllegalStateException("Cannot submit survey for an open ticket");
        }

        if (surveyRepository.existsByTicketId(ticketId)) {
            throw new IllegalStateException("Survey already submitted for this ticket");
        }

        SatisfactionSurvey survey = SatisfactionSurvey.builder()
                .ticket(ticket)
                .rating(rating)
                .feedback(feedback)
                .build();

        return surveyRepository.save(survey);
    }

    public List<SupportTicket> getCustomerTickets(UUID customerId) {
        return ticketRepository.findByCustomerIdOrderByCreatedAtDesc(customerId);
    }

    public List<SupportTicket> getAllTickets() {
        return ticketRepository.findAll();
    }

    public List<SupportTicket> getAllTicketsByStatus(String status) {
        return ticketRepository.findByStatus(status);
    }

    public List<SupportTicket> getAssignedTickets(UUID agentId) {
        return ticketRepository.findByAssignedAgentId(agentId);
    }

    public List<SupportMessageResponse> getTicketMessages(UUID ticketId) {
        return messageRepository.findByTicketIdOrderByCreatedAtAsc(ticketId).stream()
                .map(this::toMessageResponse)
                .toList();
    }

    public SupportTicket getTicketById(UUID ticketId) {
        return ticketRepository.findById(ticketId)
                .orElseThrow(() -> new ResourceNotFoundException("Ticket not found"));
    }

    public TicketDetailResponse getTicketDetail(UUID ticketId) {
        SupportTicket t = getTicketById(ticketId);
        boolean surveyed = surveyRepository.existsByTicketId(ticketId);
        return TicketDetailResponse.builder()
                .id(t.getId())
                .title(t.getTitle())
                .description(t.getDescription())
                .status(t.getStatus())
                .priority(t.getPriority())
                .createdAt(t.getCreatedAt())
                .updatedAt(t.getUpdatedAt())
                .customerId(t.getCustomer().getId())
                .customerFirstName(t.getCustomer().getFirstName())
                .customerEmail(t.getCustomer().getEmail())
                .agentId(t.getAssignedAgent() != null ? t.getAssignedAgent().getId() : null)
                .agentFirstName(t.getAssignedAgent() != null ? t.getAssignedAgent().getFirstName() : null)
                .agentEmail(t.getAssignedAgent() != null ? t.getAssignedAgent().getEmail() : null)
                .surveyed(surveyed)
                .build();
    }

    public SupportMessageResponse toMessageResponse(SupportMessage m) {
        return SupportMessageResponse.builder()
                .id(m.getId())
                .ticketId(m.getTicket().getId())
                .senderId(m.getSender().getId())
                .senderFirstName(m.getSender().getFirstName())
                .senderEmail(m.getSender().getEmail())
                .message(m.getMessage())
                .createdAt(m.getCreatedAt())
                .build();
    }
}
