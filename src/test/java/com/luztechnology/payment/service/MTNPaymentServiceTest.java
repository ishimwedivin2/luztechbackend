package com.luztechnology.payment.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.web.reactive.function.client.WebClient;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

class MTNPaymentServiceTest {

    @Mock
    private WebClient webClient;

    private ObjectMapper objectMapper;
    private MTNPaymentService mtnPaymentService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        objectMapper = new ObjectMapper();
        mtnPaymentService = new MTNPaymentService(webClient, objectMapper);
    }

    @Test
    void testSupports() {
        assertTrue(mtnPaymentService.supports("MTN_MOMO"));
        assertTrue(mtnPaymentService.supports("mtn_momo"));
        assertFalse(mtnPaymentService.supports("AIRTEL_MOMO"));
        assertFalse(mtnPaymentService.supports("PAYPAL"));
    }
}
