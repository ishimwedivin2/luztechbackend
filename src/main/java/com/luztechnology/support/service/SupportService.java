package com.luztechnology.support.service;

import com.luztechnology.common.exception.ResourceNotFoundException;
import com.luztechnology.support.entity.SatisfactionSurvey;
import com.luztechnology.support.entity.SupportMessage;
import com.luztechnology.support.entity.SupportTicket;
import com.luztechnology.support.repository.SatisfactionSurveyRepository;
import com.luztechnology.support.repository.SupportMessageRepository;
import com.luztechnology.support.repository.SupportTicketRepository;
import com.luztechnology.user.entity.User;
import com.luztechnology.user.repository.UserRepository;
import com.luztechnology.notification.service.NotificationService;
import lombok.RequiredArgsConstructor;
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

    @Transactional
    public SupportTicket createTicket(User customer, String title, String description, String priority) {
        SupportTicket ticket = SupportTicket.builder()
                .customer(customer)
                .title(title)
                .description(description)
                .status("OPEN")
                .priority(priority != null ? priority : "MEDIUM")
                .build();

        SupportTicket savedTicket = ticketRepository.save(ticket);

        // Initial message
        addMessage(savedTicket, customer, description);

        return savedTicket;
    }

    @Transactional
    public SupportMessage addMessage(SupportTicket ticket, User sender, String content) {
        SupportMessage message = SupportMessage.builder()
                .ticket(ticket)
                .sender(sender)
                .message(content)
                .build();

        SupportMessage savedMessage = messageRepository.save(message);

        // Notify customer if agent/admin replies
        if (sender != null && ticket.getCustomer() != null && !sender.getId().equals(ticket.getCustomer().getId())) {
            notificationService.createNotification(
                    ticket.getCustomer(),
                    "Support Update",
                    "There is a new reply on your ticket: " + ticket.getTitle(),
                    "SUPPORT",
                    ticket.getId().toString()
            );
        }

        return savedMessage;
    }

    @Transactional
    public SupportTicket assignTicket(UUID ticketId, UUID agentId) {
        SupportTicket ticket = ticketRepository.findById(ticketId)
                .orElseThrow(() -> new ResourceNotFoundException("Ticket not found"));

        User agent = userRepository.findById(agentId)
                .orElseThrow(() -> new ResourceNotFoundException("Agent not found"));

        ticket.setAssignedAgent(agent);
        ticket.setStatus("IN_PROGRESS");
        SupportTicket saved = ticketRepository.save(ticket);

        // Notify customer that an agent has been assigned
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

    public List<SupportMessage> getTicketMessages(UUID ticketId) {
        return messageRepository.findByTicketIdOrderByCreatedAtAsc(ticketId);
    }
}
