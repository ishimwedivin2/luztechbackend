# MTN MoMo Sandbox Automated Test Execution Report

Executed at: Sat Jun 27 13:08:42 SAST 2026

| Test case ID | Scenario Title | Step Description | API URL | Expected Result | Api Response | Actual Result |
|---|---|---|---|---|---|---|
| 1 | SandBox User Provisioning | Create Api User | `https://sandbox.momodeveloper.mtn.com/v1_0/apiuser` | 201 or 202 Created | Status: 201. Provisioned API User UUID: e479db2e-40fd-432e-b7f5-b84d91b92488 | **Pass** |
| 2 | SandBox User Provisioning | Create Api key | `https://sandbox.momodeveloper.mtn.com/v1_0/apiuser/{X-Reference-Id}/apikey` | 201 Created containing apiKey | Status: 201. API Key: 76368adf179946178c572621c0c445b3 | **Pass** |
| 3 | Collection Api | Token | `https://sandbox.momodeveloper.mtn.com/collection/token/` | 200 OK containing access_token | Status: 200. Token starts with: eyJ0eXAiOi... | **Pass** |
| 4 | Collection Api | Debit Request/ Request to pay | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/requesttopay` | 202 Accepted | Status: 202. RefId: 3b7c8f91-932d-42da-8312-b743899ecc7a | **Pass** |
| 5 | Collection Api | Get Api/ Request to pay Status | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/requesttopay/{referenceId}` | 200 OK containing status | Status: 200. Content: {"financialTransactionId":"1502927144","externalId":"ORDER_TST_123","amount":"100","currency":"EUR","payer":{"partyIdType":"MSISDN","partyId":"250788888888"},"payerMessage":"Collection Test","payeeNote":"Test payee note","status":"SUCCESSFUL"} | **Pass** |
| 6 | Collection Api | Account Status Check | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/accountholder/{accountHolderIdType}/{accountHolderId}/active` | 200 OK with active=true | Status: 200 -  | **Fail** |
| 7 | Collection Api | Account Balance Check | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/account/balance` | 200 OK containing balance details | Status: 200. Content: {"availableBalance":"0","currency":"EUR"} | **Pass** |
| 8 | Disbursement Api | Token | `https://sandbox.momodeveloper.mtn.com/disbursement/token/` | 200 OK containing access_token | Status: 200. Token starts with: eyJ0eXAiOi... | **Pass** |
| 9 | Disbursement Api | Transfer | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/transfer` | 202 Accepted | Status: 202. RefId: 131db3a9-ee67-4caf-b3d4-ca3a169aadba | **Pass** |
| 10 | Disbursement Api | Account Balance Check | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/account/balance` | 200 OK containing balance details | Status: 200. Content: {"availableBalance":"1000","currency":"EUR"} | **Pass** |
| 11 | Disbursement Api | Refund | `https://sandbox.momodeveloper.mtn.com/disbursement/v2_0/refund` | 202 Accepted | Status: 202. Refund RefId: 239053b2-cd58-4179-a0a9-b463034f66bf | **Pass** |
| 12 | Disbursement Api | Get Refund Status | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/refund/{referenceId}` | 200 OK containing refund status | Status: 200. Content: {"financialTransactionId":"1603469209","externalId":"RF_DST_789","amount":"20","currency":"EUR","payee":{"partyIdType":"PARTY_CODE","partyId":"d4b6aa3d-e63f-4ad5-88e3-ed0142b92b0f"},"payerMessage":"Refund Test","payeeNote":"Test refund note","status":"SUCCESSFUL"} | **Pass** |
| 13 | Disbursement Api | Get Api/ Transfer Status | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/transfer/{referenceId}` | 200 OK containing transfer status | Status: 200. Content: {"amount":"50","currency":"EUR","financialTransactionId":"684835019","externalId":"TX_DST_456","payee":{"partyIdType":"MSISDN","partyId":"250788888888"},"payerMessage":"Transfer Test","payeeNote":"Test payee note","status":"SUCCESSFUL"} | **Pass** |
