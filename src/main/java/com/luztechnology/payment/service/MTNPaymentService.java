package com.luztechnology.payment.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.luztechnology.order.entity.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
public class MTNPaymentService implements PaymentService {

    private static final Logger logger = LoggerFactory.getLogger(MTNPaymentService.class);

    private final WebClient webClient;
    private final ObjectMapper objectMapper;

    @Value("${payment.mtn.collection-subscription-key:}")
    private String collectionSubscriptionKey;

    @Value("${payment.mtn.disbursement-subscription-key:}")
    private String disbursementSubscriptionKey;

    @Value("${payment.mtn.api-user:}")
    private String configuredApiUser;

    @Value("${payment.mtn.api-key:}")
    private String configuredApiKey;

    @Value("${payment.mtn.target-environment:sandbox}")
    private String targetEnvironment;

    @Value("${payment.mtn.base-url:https://sandbox.momodeveloper.mtn.com}")
    private String baseUrl;

    @Value("${payment.mtn.callback-host:localhost}")
    private String callbackHost;

    // Cache dynamic apiUser and apiKey for session if not configured in application.yml
    private String activeApiUser;
    private String activeApiKey;

    public MTNPaymentService(WebClient webClient, ObjectMapper objectMapper) {
        this.webClient = webClient;
        this.objectMapper = objectMapper;
    }

    @Override
    public boolean supports(String paymentMethod) {
        return "MTN_MOMO".equalsIgnoreCase(paymentMethod);
    }

    @Override
    public String initiatePayment(Order order) {
        logger.info("Initiating MTN MoMo payment for Order ID: {}, Amount: {}", order.getId(), order.getTotalAmount());
        
        try {
            // Ensure we have active apiUser and apiKey
            ensureApiCredentials(collectionSubscriptionKey);

            // Request Token
            String token = getAccessToken(activeApiUser, activeApiKey, collectionSubscriptionKey, "/collection/token/");
            
            // X-Reference-Id for this payment transaction
            String referenceId = UUID.randomUUID().toString();
            
            // In Sandbox, only "EUR" is accepted.
            String currency = "sandbox".equalsIgnoreCase(targetEnvironment) ? "EUR" : "RWF";
            
            // Payer phone number
            String rawPhone = order.getCustomer().getPhoneNumber();
            // Default to a sandbox testing phone number if not provided or empty
            String phoneNumber = (rawPhone == null || rawPhone.trim().isEmpty()) ? "250788888888" : rawPhone;
            
            // Normalize phone number (MTN needs MSISDN, numbers only, or standard formats)
            phoneNumber = phoneNumber.replace("+", "").replace(" ", "");

            Map<String, Object> body = new HashMap<>();
            body.put("amount", order.getTotalAmount().toString());
            body.put("currency", currency);
            body.put("externalId", order.getOrderNumber());
            
            Map<String, String> payer = new HashMap<>();
            payer.put("partyIdType", "MSISDN");
            payer.put("partyId", phoneNumber);
            body.put("payer", payer);
            
            body.put("payerMessage", "Payment for Order " + order.getOrderNumber());
            body.put("payeeNote", "Luz Technology payment");

            logger.info("Sending Request to Pay. Reference ID: {}, Amount: {}, Currency: {}, Phone: {}", 
                    referenceId, order.getTotalAmount(), currency, phoneNumber);

            webClient.post()
                    .uri(baseUrl + "/collection/v1_0/requesttopay")
                    .header("Authorization", "Bearer " + token)
                    .header("X-Reference-Id", referenceId)
                    .header("X-Target-Environment", targetEnvironment)
                    .header("Ocp-Apim-Subscription-Key", collectionSubscriptionKey)
                    .contentType(MediaType.APPLICATION_JSON)
                    .bodyValue(body)
                    .retrieve()
                    .toBodilessEntity()
                    .block();

            logger.info("Request to pay sent successfully. Ref: {}", referenceId);
            return referenceId;
        } catch (Exception e) {
            logger.error("Failed to initiate MTN MoMo payment", e);
            throw new RuntimeException("MTN MoMo payment initiation failed: " + e.getMessage(), e);
        }
    }

    @Override
    public boolean verifyWebhook(String payload, String signature) {
        logger.info("Verifying MTN MoMo Webhook. Payload: {}", payload);
        try {
            // Find referenceId from payload
            JsonNode root = objectMapper.readTree(payload);
            String referenceId = root.has("financialTransactionId") 
                    ? root.get("financialTransactionId").asText() 
                    : (root.has("referenceId") ? root.get("referenceId").asText() : null);

            if (referenceId == null) {
                logger.warn("Could not extract referenceId from webhook payload. Webhook check skipped.");
                return false;
            }

            // Verify status directly from MTN API
            ensureApiCredentials(collectionSubscriptionKey);
            String token = getAccessToken(activeApiUser, activeApiKey, collectionSubscriptionKey, "/collection/token/");
            
            JsonNode statusResponse = webClient.get()
                    .uri(baseUrl + "/collection/v1_0/requesttopay/" + referenceId)
                    .header("Authorization", "Bearer " + token)
                    .header("X-Target-Environment", targetEnvironment)
                    .header("Ocp-Apim-Subscription-Key", collectionSubscriptionKey)
                    .retrieve()
                    .bodyToMono(JsonNode.class)
                    .block();

            if (statusResponse != null && statusResponse.has("status")) {
                String status = statusResponse.get("status").asText();
                logger.info("Checked MTN payment status for {}: {}", referenceId, status);
                return "SUCCESSFUL".equalsIgnoreCase(status);
            }
            
            return false;
        } catch (Exception e) {
            logger.error("Failed to verify MTN webhook", e);
            return false;
        }
    }

    public synchronized void ensureApiCredentials(String subscriptionKey) {
        if (activeApiUser != null && activeApiKey != null) {
            return;
        }
        if (configuredApiUser != null && !configuredApiUser.trim().isEmpty() &&
            configuredApiKey != null && !configuredApiKey.trim().isEmpty()) {
            activeApiUser = configuredApiUser;
            activeApiKey = configuredApiKey;
            logger.info("Using configured MTN MoMo API User: {}", activeApiUser);
            return;
        }
        
        logger.info("MTN MoMo API credentials not configured. Provisioning dynamic sandbox API User and Key...");
        Map<String, String> credentials = provisionApiUserAndKey(subscriptionKey);
        this.activeApiUser = credentials.get("apiUser");
        this.activeApiKey = credentials.get("apiKey");
    }

    public Map<String, String> provisionApiUserAndKey(String subscriptionKey) {
        if (subscriptionKey == null || subscriptionKey.trim().isEmpty()) {
            throw new IllegalArgumentException("MTN Subscription Key is missing. Cannot provision API User/Key.");
        }
        try {
            // 1. Provision API User
            String apiUserUuid = UUID.randomUUID().toString();
            Map<String, String> userBody = new HashMap<>();
            userBody.put("providerCallbackHost", callbackHost);
            
            webClient.post()
                    .uri(baseUrl + "/v1_0/apiuser")
                    .header("X-Reference-Id", apiUserUuid)
                    .header("Ocp-Apim-Subscription-Key", subscriptionKey)
                    .contentType(MediaType.APPLICATION_JSON)
                    .bodyValue(userBody)
                    .retrieve()
                    .toBodilessEntity()
                    .block();

            logger.info("Sandbox API User provisioned successfully. UUID: {}", apiUserUuid);

            // 2. Provision API Key
            JsonNode keyResponse = webClient.post()
                    .uri(baseUrl + "/v1_0/apiuser/" + apiUserUuid + "/apikey")
                    .header("Ocp-Apim-Subscription-Key", subscriptionKey)
                    .retrieve()
                    .bodyToMono(JsonNode.class)
                    .block();

            if (keyResponse != null && keyResponse.has("apiKey")) {
                String apiKey = keyResponse.get("apiKey").asText();
                logger.info("Sandbox API Key provisioned successfully.");
                Map<String, String> result = new HashMap<>();
                result.put("apiUser", apiUserUuid);
                result.put("apiKey", apiKey);
                return result;
            } else {
                throw new RuntimeException("API Key response did not contain 'apiKey'");
            }
        } catch (Exception e) {
            logger.error("Failed to provision MTN MoMo Sandbox credentials", e);
            throw new RuntimeException("MTN Sandbox Provisioning failed: " + e.getMessage(), e);
        }
    }

    public String getAccessToken(String apiUser, String apiKey, String subscriptionKey, String tokenPath) {
        String authString = apiUser + ":" + apiKey;
        String basicAuth = Base64.getEncoder().encodeToString(authString.getBytes());

        JsonNode response = webClient.post()
                .uri(baseUrl + tokenPath)
                .header("Authorization", "Basic " + basicAuth)
                .header("Ocp-Apim-Subscription-Key", subscriptionKey)
                .retrieve()
                .bodyToMono(JsonNode.class)
                .block();

        if (response != null && response.has("access_token")) {
            return response.get("access_token").asText();
        } else {
            throw new RuntimeException("OAuth Token response did not contain 'access_token'");
        }
    }

    // Getters for properties to use in test runner
    public String getCollectionSubscriptionKey() { return collectionSubscriptionKey; }
    public String getDisbursementSubscriptionKey() { return disbursementSubscriptionKey; }
    public String getTargetEnvironment() { return targetEnvironment; }
    public String getBaseUrl() { return baseUrl; }
    public String getCallbackHost() { return callbackHost; }
}
