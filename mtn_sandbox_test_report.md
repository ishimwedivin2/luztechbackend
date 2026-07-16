# MTN MoMo Sandbox Automated Test Execution Report

Executed at: Thu Jul 16 23:16:43 SAST 2026

| Test case ID | Scenario Title | Step Description | API URL | Expected Result | Api Response | Actual Result |
|---|---|---|---|---|---|---|
| 1 | SandBox User Provisioning | Create Api User | `https://sandbox.momodeveloper.mtn.com/v1_0/apiuser` | 201 or 202 Created | Status: 201. Provisioned API User UUID: 8aa4d507-c948-4fc4-a68e-45c42cc8133a | **Pass** |
| 2 | SandBox User Provisioning | Create Api key | `https://sandbox.momodeveloper.mtn.com/v1_0/apiuser/{X-Reference-Id}/apikey` | 201 Created containing apiKey | Status: 201. API Key: 3e716bb291eb4d6397a35d0fc7c4475b | **Pass** |
| 3 | Collection Api | Token | `https://sandbox.momodeveloper.mtn.com/collection/token/` | 200 OK containing access_token | Status: 200. Token starts with: eyJ0eXAiOi... | **Pass** |
| 4 | Collection Api | Debit Request/ Request to pay | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/requesttopay` | 202 Accepted | Status: 202. RefId: c081d312-570b-4d51-a86a-1723b21bed1b | **Pass** |
| 5 | Collection Api | Get Api/ Request to pay Status | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/requesttopay/{referenceId}` | 200 OK containing status | Status: 200. Content: {"financialTransactionId":"1742643352","externalId":"ORDER_TST_123","amount":"100","currency":"EUR","payer":{"partyIdType":"MSISDN","partyId":"250788888888"},"payerMessage":"Collection Test","payeeNote":"Test payee note","status":"SUCCESSFUL"} | **Pass** |
| 6 | Collection Api | Account Status Check | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/accountholder/{accountHolderIdType}/{accountHolderId}/active` | 200 OK with active=true | Status: 200 -  | **Fail** |
| 7 | Collection Api | Account Balance Check | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/account/balance` | 200 OK containing balance details | Status: 500 - {"message":"An internal error occurred while processing.","code":"INTERNAL_PROCESSING_ERROR"} | **Fail** |
| 8 | Disbursement Api | Token | `https://sandbox.momodeveloper.mtn.com/disbursement/token/` | 200 OK containing access_token | Status: 200. Token starts with: eyJ0eXAiOi... | **Pass** |
| 9 | Disbursement Api | Transfer | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/transfer` | 202 Accepted | Status: 202. RefId: a765e9cd-091e-4d98-bdc1-d404df6c8f11 | **Pass** |
| 10 | Disbursement Api | Account Balance Check | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/account/balance` | 200 OK containing balance details | Status: 200. Content: {"availableBalance":"1000","currency":"EUR"} | **Pass** |
| 11 | Disbursement Api | Refund | `https://sandbox.momodeveloper.mtn.com/disbursement/v2_0/refund` | 202 Accepted | Status: 202. Refund RefId: 1e75cd17-10f8-4286-92e9-02e9ca826577 | **Pass** |
| 12 | Disbursement Api | Get Refund Status | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/refund/{referenceId}` | 200 OK containing refund status | Status: 200. Content: {"financialTransactionId":"743075394","externalId":"RF_DST_789","amount":"20","currency":"EUR","payee":{"partyIdType":"PARTY_CODE","partyId":"2a0433f4-626d-4847-8d6f-9397663cda60"},"payerMessage":"Refund Test","payeeNote":"Test refund note","status":"SUCCESSFUL"} | **Pass** |
| 13 | Disbursement Api | Get Api/ Transfer Status | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/transfer/{referenceId}` | 200 OK containing transfer status | Status: 200. Content: {"amount":"50","currency":"EUR","financialTransactionId":"991406558","externalId":"TX_DST_456","payee":{"partyIdType":"MSISDN","partyId":"250788888888"},"payerMessage":"Transfer Test","payeeNote":"Test payee note","status":"SUCCESSFUL"} | **Pass** |
