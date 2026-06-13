package com.luztechnology.payment.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.luztechnology.payment.service.MTNPaymentService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.reactive.function.client.WebClientResponseException;

import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

@RestController
@RequestMapping("/api/payments/mtn")
@RequiredArgsConstructor
public class MtnSandboxTestController {

    private static final Logger logger = LoggerFactory.getLogger(MtnSandboxTestController.class);

    private final MTNPaymentService mtnPaymentService;
    private final WebClient webClient;
    private final ObjectMapper objectMapper;

    @PostMapping("/run-tests")
    public ResponseEntity<List<Map<String, Object>>> runTests(
            @RequestHeader(value = "X-Collection-Subscription-Key", required = false) String headerCollectionKey,
            @RequestHeader(value = "X-Disbursement-Subscription-Key", required = false) String headerDisbursementKey) {

        String collectionKey = (headerCollectionKey != null && !headerCollectionKey.trim().isEmpty())
                ? headerCollectionKey : mtnPaymentService.getCollectionSubscriptionKey();
        
        String disbursementKey = (headerDisbursementKey != null && !headerDisbursementKey.trim().isEmpty())
                ? headerDisbursementKey : mtnPaymentService.getDisbursementSubscriptionKey();

        logger.info("Starting MTN MoMo Sandbox automated test suite...");
        List<Map<String, Object>> results = new ArrayList<>();

        // Test variables shared between steps
        String collectionApiUser = null;
        String collectionApiKey = null;
        String collectionToken = null;
        String requestToPayRefId = null;

        String disbursementApiUser = null;
        String disbursementApiKey = null;
        String disbursementToken = null;
        String transferRefId = null;
        String refundRefId = null;

        String baseUrl = mtnPaymentService.getBaseUrl();
        String targetEnv = mtnPaymentService.getTargetEnvironment();
        String callbackHost = mtnPaymentService.getCallbackHost();

        // 1. Create Api User (Collection)
        Map<String, Object> step1 = createStep(1, "SandBox User Provisioning", "Create Api User", baseUrl + "/v1_0/apiuser", "201 or 202 Created");
        if (collectionKey == null || collectionKey.trim().isEmpty()) {
            failStep(step1, "Skipped: Collection Subscription Key is missing.");
        } else {
            try {
                collectionApiUser = UUID.randomUUID().toString();
                Map<String, String> body = new HashMap<>();
                body.put("providerCallbackHost", callbackHost);

                ResponseEntity<Void> response = webClient.post()
                        .uri(baseUrl + "/v1_0/apiuser")
                        .header("X-Reference-Id", collectionApiUser)
                        .header("Ocp-Apim-Subscription-Key", collectionKey)
                        .contentType(MediaType.APPLICATION_JSON)
                        .bodyValue(body)
                        .retrieve()
                        .toBodilessEntity()
                        .block();

                passStep(step1, "Status: " + (response != null ? response.getStatusCode().value() : "201") + ". Provisioned API User UUID: " + collectionApiUser);
            } catch (WebClientResponseException e) {
                failStep(step1, "Status: " + e.getStatusCode().value() + " - " + e.getResponseBodyAsString());
                collectionApiUser = null;
            } catch (Exception e) {
                failStep(step1, "Error: " + e.getMessage());
                collectionApiUser = null;
            }
        }
        results.add(step1);

        // 2. Create Api Key (Collection)
        Map<String, Object> step2 = createStep(2, "SandBox User Provisioning", "Create Api key", baseUrl + "/v1_0/apiuser/{X-Reference-Id}/apikey", "201 Created containing apiKey");
        if (collectionApiUser == null) {
            failStep(step2, "Skipped: Step 1 failed or was skipped.");
        } else {
            try {
                JsonNode response = webClient.post()
                        .uri(baseUrl + "/v1_0/apiuser/" + collectionApiUser + "/apikey")
                        .header("Ocp-Apim-Subscription-Key", collectionKey)
                        .retrieve()
                        .bodyToMono(JsonNode.class)
                        .block();

                if (response != null && response.has("apiKey")) {
                    collectionApiKey = response.get("apiKey").asText();
                    passStep(step2, "Status: 201. API Key: " + collectionApiKey);
                } else {
                    failStep(step2, "Response did not contain apiKey: " + response);
                }
            } catch (WebClientResponseException e) {
                failStep(step2, "Status: " + e.getStatusCode().value() + " - " + e.getResponseBodyAsString());
            } catch (Exception e) {
                failStep(step2, "Error: " + e.getMessage());
            }
        }
        results.add(step2);

        // 3. Collection Api Token
        Map<String, Object> step3 = createStep(3, "Collection Api", "Token", baseUrl + "/collection/token/", "200 OK containing access_token");
        if (collectionApiUser == null || collectionApiKey == null) {
            failStep(step3, "Skipped: Credentials missing from Step 1 & 2.");
        } else {
            try {
                String authString = collectionApiUser + ":" + collectionApiKey;
                String basicAuth = Base64.getEncoder().encodeToString(authString.getBytes());

                JsonNode response = webClient.post()
                        .uri(baseUrl + "/collection/token/")
                        .header("Authorization", "Basic " + basicAuth)
                        .header("Ocp-Apim-Subscription-Key", collectionKey)
                        .retrieve()
                        .bodyToMono(JsonNode.class)
                        .block();

                if (response != null && response.has("access_token")) {
                    collectionToken = response.get("access_token").asText();
                    passStep(step3, "Status: 200. Token starts with: " + collectionToken.substring(0, Math.min(10, collectionToken.length())) + "...");
                } else {
                    failStep(step3, "Response did not contain access_token: " + response);
                }
            } catch (WebClientResponseException e) {
                failStep(step3, "Status: " + e.getStatusCode().value() + " - " + e.getResponseBodyAsString());
            } catch (Exception e) {
                failStep(step3, "Error: " + e.getMessage());
            }
        }
        results.add(step3);

        // 4. Collection Api Debit Request/ Request to pay
        Map<String, Object> step4 = createStep(4, "Collection Api", "Debit Request/ Request to pay", baseUrl + "/collection/v1_0/requesttopay", "202 Accepted");
        if (collectionToken == null) {
            failStep(step4, "Skipped: Collection access token is missing.");
        } else {
            try {
                requestToPayRefId = UUID.randomUUID().toString();
                Map<String, Object> body = new HashMap<>();
                body.put("amount", "100.0");
                body.put("currency", "EUR");
                body.put("externalId", "ORDER_TST_123");
                
                Map<String, String> payer = new HashMap<>();
                payer.put("partyIdType", "MSISDN");
                payer.put("partyId", "250788888888");
                body.put("payer", payer);
                
                body.put("payerMessage", "Collection Test");
                body.put("payeeNote", "Test payee note");

                ResponseEntity<Void> response = webClient.post()
                        .uri(baseUrl + "/collection/v1_0/requesttopay")
                        .header("Authorization", "Bearer " + collectionToken)
                        .header("X-Reference-Id", requestToPayRefId)
                        .header("X-Target-Environment", targetEnv)
                        .header("Ocp-Apim-Subscription-Key", collectionKey)
                        .contentType(MediaType.APPLICATION_JSON)
                        .bodyValue(body)
                        .retrieve()
                        .toBodilessEntity()
                        .block();

                passStep(step4, "Status: " + (response != null ? response.getStatusCode().value() : "202") + ". RefId: " + requestToPayRefId);
            } catch (WebClientResponseException e) {
                failStep(step4, "Status: " + e.getStatusCode().value() + " - " + e.getResponseBodyAsString());
                requestToPayRefId = null;
            } catch (Exception e) {
                failStep(step4, "Error: " + e.getMessage());
                requestToPayRefId = null;
            }
        }
        results.add(step4);

        // 5. Collection Api Get Api/ Request to pay Status
        Map<String, Object> step5 = createStep(5, "Collection Api", "Get Api/ Request to pay Status", baseUrl + "/collection/v1_0/requesttopay/{referenceId}", "200 OK containing status");
        if (collectionToken == null || requestToPayRefId == null) {
            failStep(step5, "Skipped: Token or RefId missing.");
        } else {
            try {
                JsonNode response = webClient.get()
                        .uri(baseUrl + "/collection/v1_0/requesttopay/" + requestToPayRefId)
                        .header("Authorization", "Bearer " + collectionToken)
                        .header("X-Target-Environment", targetEnv)
                        .header("Ocp-Apim-Subscription-Key", collectionKey)
                        .retrieve()
                        .bodyToMono(JsonNode.class)
                        .block();

                passStep(step5, "Status: 200. Content: " + response.toString());
            } catch (WebClientResponseException e) {
                failStep(step5, "Status: " + e.getStatusCode().value() + " - " + e.getResponseBodyAsString());
            } catch (Exception e) {
                failStep(step5, "Error: " + e.getMessage());
            }
        }
        results.add(step5);

        // 6. Collection Api Account Status Check
        Map<String, Object> step6 = createStep(6, "Collection Api", "Account Status Check", baseUrl + "/collection/v1_0/accountholder/{accountHolderIdType}/{accountHolderId}/active", "200 OK with active=true");
        if (collectionToken == null) {
            failStep(step6, "Skipped: Collection access token is missing.");
        } else {
            try {
                JsonNode response = webClient.get()
                        .uri(baseUrl + "/collection/v1_0/accountholder/MSISDN/250788888888/active")
                        .header("Authorization", "Bearer " + collectionToken)
                        .header("X-Target-Environment", targetEnv)
                        .header("Ocp-Apim-Subscription-Key", collectionKey)
                        .retrieve()
                        .bodyToMono(JsonNode.class)
                        .block();

                passStep(step6, "Status: 200. Content: " + response.toString());
            } catch (WebClientResponseException e) {
                failStep(step6, "Status: " + e.getStatusCode().value() + " - " + e.getResponseBodyAsString());
            } catch (Exception e) {
                failStep(step6, "Error: " + e.getMessage());
            }
        }
        results.add(step6);

        // 7. Collection Api Account Balance Check
        Map<String, Object> step7 = createStep(7, "Collection Api", "Account Balance Check", baseUrl + "/collection/v1_0/account/balance", "200 OK containing balance details");
        if (collectionToken == null) {
            failStep(step7, "Skipped: Collection access token is missing.");
        } else {
            try {
                JsonNode response = webClient.get()
                        .uri(baseUrl + "/collection/v1_0/account/balance")
                        .header("Authorization", "Bearer " + collectionToken)
                        .header("X-Target-Environment", targetEnv)
                        .header("Ocp-Apim-Subscription-Key", collectionKey)
                        .retrieve()
                        .bodyToMono(JsonNode.class)
                        .block();

                passStep(step7, "Status: 200. Content: " + response.toString());
            } catch (WebClientResponseException e) {
                failStep(step7, "Status: " + e.getStatusCode().value() + " - " + e.getResponseBodyAsString());
            } catch (Exception e) {
                failStep(step7, "Error: " + e.getMessage());
            }
        }
        results.add(step7);

        // --- DISBURSEMENT API ---

        // 8. Disbursement Api Token (Needs provisioning disbursement api user & key first!)
        Map<String, Object> step8 = createStep(8, "Disbursement Api", "Token", baseUrl + "/disbursement/token/", "200 OK containing access_token");
        if (disbursementKey == null || disbursementKey.trim().isEmpty()) {
            failStep(step8, "Skipped: Disbursement Subscription Key is missing.");
        } else {
            try {
                // Provision a separate api user for Disbursements
                disbursementApiUser = UUID.randomUUID().toString();
                Map<String, String> userBody = new HashMap<>();
                userBody.put("providerCallbackHost", callbackHost);

                // Create Api User
                webClient.post()
                        .uri(baseUrl + "/v1_0/apiuser")
                        .header("X-Reference-Id", disbursementApiUser)
                        .header("Ocp-Apim-Subscription-Key", disbursementKey)
                        .contentType(MediaType.APPLICATION_JSON)
                        .bodyValue(userBody)
                        .retrieve()
                        .toBodilessEntity()
                        .block();

                // Create Api Key
                JsonNode keyResponse = webClient.post()
                        .uri(baseUrl + "/v1_0/apiuser/" + disbursementApiUser + "/apikey")
                        .header("Ocp-Apim-Subscription-Key", disbursementKey)
                        .retrieve()
                        .bodyToMono(JsonNode.class)
                        .block();

                if (keyResponse != null && keyResponse.has("apiKey")) {
                    disbursementApiKey = keyResponse.get("apiKey").asText();
                    
                    // Request token
                    String authString = disbursementApiUser + ":" + disbursementApiKey;
                    String basicAuth = Base64.getEncoder().encodeToString(authString.getBytes());

                    JsonNode tokenResponse = webClient.post()
                            .uri(baseUrl + "/disbursement/token/")
                            .header("Authorization", "Basic " + basicAuth)
                            .header("Ocp-Apim-Subscription-Key", disbursementKey)
                            .retrieve()
                            .bodyToMono(JsonNode.class)
                            .block();

                    if (tokenResponse != null && tokenResponse.has("access_token")) {
                        disbursementToken = tokenResponse.get("access_token").asText();
                        passStep(step8, "Status: 200. Token starts with: " + disbursementToken.substring(0, Math.min(10, disbursementToken.length())) + "...");
                    } else {
                        failStep(step8, "Token response did not contain access_token: " + tokenResponse);
                    }
                } else {
                    failStep(step8, "Key response did not contain apiKey: " + keyResponse);
                }
            } catch (WebClientResponseException e) {
                failStep(step8, "Status: " + e.getStatusCode().value() + " - " + e.getResponseBodyAsString());
            } catch (Exception e) {
                failStep(step8, "Error: " + e.getMessage());
            }
        }
        results.add(step8);

        // 9. Disbursement Api Transfer
        Map<String, Object> step9 = createStep(9, "Disbursement Api", "Transfer", baseUrl + "/disbursement/v1_0/transfer", "202 Accepted");
        if (disbursementToken == null) {
            failStep(step9, "Skipped: Disbursement access token is missing.");
        } else {
            try {
                transferRefId = UUID.randomUUID().toString();
                Map<String, Object> body = new HashMap<>();
                body.put("amount", "50.0");
                body.put("currency", "EUR");
                body.put("externalId", "TX_DST_456");
                
                Map<String, String> payee = new HashMap<>();
                payee.put("partyIdType", "MSISDN");
                payee.put("partyId", "250788888888");
                body.put("payee", payee);
                
                body.put("payerMessage", "Transfer Test");
                body.put("payeeNote", "Test payee note");

                ResponseEntity<Void> response = webClient.post()
                        .uri(baseUrl + "/disbursement/v1_0/transfer")
                        .header("Authorization", "Bearer " + disbursementToken)
                        .header("X-Reference-Id", transferRefId)
                        .header("X-Target-Environment", targetEnv)
                        .header("Ocp-Apim-Subscription-Key", disbursementKey)
                        .contentType(MediaType.APPLICATION_JSON)
                        .bodyValue(body)
                        .retrieve()
                        .toBodilessEntity()
                        .block();

                passStep(step9, "Status: " + (response != null ? response.getStatusCode().value() : "202") + ". RefId: " + transferRefId);
            } catch (WebClientResponseException e) {
                failStep(step9, "Status: " + e.getStatusCode().value() + " - " + e.getResponseBodyAsString());
                transferRefId = null;
            } catch (Exception e) {
                failStep(step9, "Error: " + e.getMessage());
                transferRefId = null;
            }
        }
        results.add(step9);

        // 10. Disbursement Api Account Balance Check
        Map<String, Object> step10 = createStep(10, "Disbursement Api", "Account Balance Check", baseUrl + "/disbursement/v1_0/account/balance", "200 OK containing balance details");
        if (disbursementToken == null) {
            failStep(step10, "Skipped: Disbursement access token is missing.");
        } else {
            try {
                JsonNode response = webClient.get()
                        .uri(baseUrl + "/disbursement/v1_0/account/balance")
                        .header("Authorization", "Bearer " + disbursementToken)
                        .header("X-Target-Environment", targetEnv)
                        .header("Ocp-Apim-Subscription-Key", disbursementKey)
                        .retrieve()
                        .bodyToMono(JsonNode.class)
                        .block();

                passStep(step10, "Status: 200. Content: " + response.toString());
            } catch (WebClientResponseException e) {
                failStep(step10, "Status: " + e.getStatusCode().value() + " - " + e.getResponseBodyAsString());
            } catch (Exception e) {
                failStep(step10, "Error: " + e.getMessage());
            }
        }
        results.add(step10);

        // 11. Disbursement Api Refund
        Map<String, Object> step11 = createStep(11, "Disbursement Api", "Refund", baseUrl + "/disbursement/v2_0/refund", "202 Accepted");
        if (disbursementToken == null || transferRefId == null) {
            failStep(step11, "Skipped: Disbursement access token or transfer reference ID is missing.");
        } else {
            try {
                refundRefId = UUID.randomUUID().toString();
                Map<String, Object> body = new HashMap<>();
                body.put("amount", "20.0");
                body.put("currency", "EUR");
                body.put("externalId", "RF_DST_789");
                body.put("referenceIdToRefund", transferRefId);
                body.put("payerMessage", "Refund Test");
                body.put("payeeNote", "Test refund note");

                ResponseEntity<Void> response = webClient.post()
                        .uri(baseUrl + "/disbursement/v2_0/refund")
                        .header("Authorization", "Bearer " + disbursementToken)
                        .header("X-Reference-Id", refundRefId)
                        .header("X-Target-Environment", targetEnv)
                        .header("Ocp-Apim-Subscription-Key", disbursementKey)
                        .contentType(MediaType.APPLICATION_JSON)
                        .bodyValue(body)
                        .retrieve()
                        .toBodilessEntity()
                        .block();

                passStep(step11, "Status: " + (response != null ? response.getStatusCode().value() : "202") + ". Refund RefId: " + refundRefId);
            } catch (WebClientResponseException e) {
                failStep(step11, "Status: " + e.getStatusCode().value() + " - " + e.getResponseBodyAsString());
                refundRefId = null;
            } catch (Exception e) {
                failStep(step11, "Error: " + e.getMessage());
                refundRefId = null;
            }
        }
        results.add(step11);

        // 12. Disbursement Api Get Refund Status
        Map<String, Object> step12 = createStep(12, "Disbursement Api", "Get Refund Status", baseUrl + "/disbursement/v1_0/refund/{referenceId}", "200 OK containing refund status");
        if (disbursementToken == null || refundRefId == null) {
            failStep(step12, "Skipped: Disbursement token or refund Reference ID is missing.");
        } else {
            try {
                JsonNode response = webClient.get()
                        .uri(baseUrl + "/disbursement/v1_0/refund/" + refundRefId)
                        .header("Authorization", "Bearer " + disbursementToken)
                        .header("X-Target-Environment", targetEnv)
                        .header("Ocp-Apim-Subscription-Key", disbursementKey)
                        .retrieve()
                        .bodyToMono(JsonNode.class)
                        .block();

                passStep(step12, "Status: 200. Content: " + response.toString());
            } catch (WebClientResponseException e) {
                failStep(step12, "Status: " + e.getStatusCode().value() + " - " + e.getResponseBodyAsString());
            } catch (Exception e) {
                failStep(step12, "Error: " + e.getMessage());
            }
        }
        results.add(step12);

        // 13. Disbursement Api Get Api/ Transfer Status
        Map<String, Object> step13 = createStep(13, "Disbursement Api", "Get Api/ Transfer Status", baseUrl + "/disbursement/v1_0/transfer/{referenceId}", "200 OK containing transfer status");
        if (disbursementToken == null || transferRefId == null) {
            failStep(step13, "Skipped: Disbursement token or transfer Reference ID is missing.");
        } else {
            try {
                JsonNode response = webClient.get()
                        .uri(baseUrl + "/disbursement/v1_0/transfer/" + transferRefId)
                        .header("Authorization", "Bearer " + disbursementToken)
                        .header("X-Target-Environment", targetEnv)
                        .header("Ocp-Apim-Subscription-Key", disbursementKey)
                        .retrieve()
                        .bodyToMono(JsonNode.class)
                        .block();

                passStep(step13, "Status: 200. Content: " + response.toString());
            } catch (WebClientResponseException e) {
                failStep(step13, "Status: " + e.getStatusCode().value() + " - " + e.getResponseBodyAsString());
            } catch (Exception e) {
                failStep(step13, "Error: " + e.getMessage());
            }
        }
        results.add(step13);

        // Generate report file
        writeReportFile(results);

        return ResponseEntity.ok(results);
    }

    private Map<String, Object> createStep(int id, String scenario, String stepDesc, String url, String expected) {
        Map<String, Object> step = new LinkedHashMap<>();
        step.put("testCaseId", id);
        step.put("scenarioTitle", scenario);
        step.put("stepDescription", stepDesc);
        step.put("apiUrl", url);
        step.put("expectedResult", expected);
        step.put("apiResponse", "Not Tested");
        step.put("actualResult", "Not Tested");
        return step;
    }

    private void passStep(Map<String, Object> step, String apiResponse) {
        step.put("apiResponse", apiResponse);
        step.put("actualResult", "Pass");
    }

    private void failStep(Map<String, Object> step, String apiResponse) {
        step.put("apiResponse", apiResponse);
        step.put("actualResult", "Fail");
    }

    private void writeReportFile(List<Map<String, Object>> results) {
        String filepath = "mtn_sandbox_test_report.md";
        try (FileWriter writer = new FileWriter(filepath)) {
            writer.write("# MTN MoMo Sandbox Automated Test Execution Report\n\n");
            writer.write("Executed at: " + new Date().toString() + "\n\n");
            writer.write("| Test case ID | Scenario Title | Step Description | API URL | Expected Result | Api Response | Actual Result |\n");
            writer.write("|---|---|---|---|---|---|---|\n");
            for (Map<String, Object> step : results) {
                writer.write(String.format("| %s | %s | %s | `%s` | %s | %s | **%s** |\n",
                        step.get("testCaseId"),
                        step.get("scenarioTitle"),
                        step.get("stepDescription"),
                        step.get("apiUrl"),
                        step.get("expectedResult"),
                        String.valueOf(step.get("apiResponse")).replace("\n", " ").replace("|", "\\|"),
                        step.get("actualResult")
                ));
            }
            logger.info("Test execution report written to: {}", new java.io.File(filepath).getAbsolutePath());
        } catch (IOException e) {
            logger.error("Failed to write test report file", e);
        }
    }
}
