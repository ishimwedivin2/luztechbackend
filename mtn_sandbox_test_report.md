# MTN MoMo Sandbox Automated Test Execution Report

Executed at: Wed Jun 24 11:37:36 SAST 2026

| Test case ID | Scenario Title | Step Description | API URL | Expected Result | Api Response | Actual Result |
|---|---|---|---|---|---|---|
| 1 | SandBox User Provisioning | Create Api User | `https://sandbox.momodeveloper.mtn.com/v1_0/apiuser` | 201 or 202 Created | Status: 201. Provisioned API User UUID: 47c6ff5f-8286-47b4-a846-17438fb27f5b | **Pass** |
| 2 | SandBox User Provisioning | Create Api key | `https://sandbox.momodeveloper.mtn.com/v1_0/apiuser/{X-Reference-Id}/apikey` | 201 Created containing apiKey | Status: 201. API Key: 526d2d3e873a483dbb56e3085ba33ce8 | **Pass** |
| 3 | Collection Api | Token | `https://sandbox.momodeveloper.mtn.com/collection/token/` | 200 OK containing access_token | Status: 200. Token starts with: eyJ0eXAiOi... | **Pass** |
| 4 | Collection Api | Debit Request/ Request to pay | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/requesttopay` | 202 Accepted | Status: 202. RefId: b61157ad-b3c0-4f7d-aeed-66968a08da3e | **Pass** |
| 5 | Collection Api | Get Api/ Request to pay Status | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/requesttopay/{referenceId}` | 200 OK containing status | Status: 200. Content: {"financialTransactionId":"1922193585","externalId":"ORDER_TST_123","amount":"100","currency":"EUR","payer":{"partyIdType":"MSISDN","partyId":"250788888888"},"payerMessage":"Collection Test","payeeNote":"Test payee note","status":"SUCCESSFUL"} | **Pass** |
| 6 | Collection Api | Account Status Check | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/accountholder/{accountHolderIdType}/{accountHolderId}/active` | 200 OK with active=true | Status: 200 -  | **Fail** |
| 7 | Collection Api | Account Balance Check | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/account/balance` | 200 OK containing balance details | Status: 500 - {"message":"An internal error occurred while processing.","code":"INTERNAL_PROCESSING_ERROR"} | **Fail** |
| 8 | Disbursement Api | Token | `https://sandbox.momodeveloper.mtn.com/disbursement/token/` | 200 OK containing access_token | Status: 200. Token starts with: eyJ0eXAiOi... | **Pass** |
| 9 | Disbursement Api | Transfer | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/transfer` | 202 Accepted | Status: 202. RefId: 0b415a20-8a4a-4774-a926-c0cec1e04f40 | **Pass** |
| 10 | Disbursement Api | Account Balance Check | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/account/balance` | 200 OK containing balance details | Status: 200. Content: {"availableBalance":"1000","currency":"EUR"} | **Pass** |
| 11 | Disbursement Api | Refund | `https://sandbox.momodeveloper.mtn.com/disbursement/v2_0/refund` | 202 Accepted | Status: 202. Refund RefId: 7a1fca38-77d6-4c30-ac58-e4ff9d43908c | **Pass** |
| 12 | Disbursement Api | Get Refund Status | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/refund/{referenceId}` | 200 OK containing refund status | Status: 200. Content: {"financialTransactionId":"1784630263","externalId":"RF_DST_789","amount":"20","currency":"EUR","payee":{"partyIdType":"PARTY_CODE","partyId":"330e01a3-399d-46e9-9d2e-a6dc431e1da2"},"payerMessage":"Refund Test","payeeNote":"Test refund note","status":"SUCCESSFUL"} | **Pass** |
| 13 | Disbursement Api | Get Api/ Transfer Status | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/transfer/{referenceId}` | 200 OK containing transfer status | Status: 200. Content: {"amount":"50","currency":"EUR","financialTransactionId":"665531335","externalId":"TX_DST_456","payee":{"partyIdType":"MSISDN","partyId":"250788888888"},"payerMessage":"Transfer Test","payeeNote":"Test payee note","status":"SUCCESSFUL"} | **Pass** |
