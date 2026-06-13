# MTN MoMo Sandbox Automated Test Execution Report

Executed at: Fri Jun 12 21:07:42 SAST 2026

| Test case ID | Scenario Title | Step Description | API URL | Expected Result | Api Response | Actual Result |
|---|---|---|---|---|---|---|
| 1 | SandBox User Provisioning | Create Api User | `https://sandbox.momodeveloper.mtn.com/v1_0/apiuser` | 201 or 202 Created | Status: 201. Provisioned API User UUID: a7d75edd-9db5-4418-9364-2f1e8ea16851 | **Pass** |
| 2 | SandBox User Provisioning | Create Api key | `https://sandbox.momodeveloper.mtn.com/v1_0/apiuser/{X-Reference-Id}/apikey` | 201 Created containing apiKey | Status: 201. API Key: 7e062dd3661f4dd9be7b52f38fd1d5ab | **Pass** |
| 3 | Collection Api | Token | `https://sandbox.momodeveloper.mtn.com/collection/token/` | 200 OK containing access_token | Status: 200. Token starts with: eyJ0eXAiOi... | **Pass** |
| 4 | Collection Api | Debit Request/ Request to pay | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/requesttopay` | 202 Accepted | Status: 202. RefId: c1d6b7e5-1a56-42c3-a59f-a53d399f74a8 | **Pass** |
| 5 | Collection Api | Get Api/ Request to pay Status | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/requesttopay/{referenceId}` | 200 OK containing status | Status: 200. Content: {"financialTransactionId":"1333342530","externalId":"ORDER_TST_123","amount":"100","currency":"EUR","payer":{"partyIdType":"MSISDN","partyId":"250788888888"},"payerMessage":"Collection Test","payeeNote":"Test payee note","status":"SUCCESSFUL"} | **Pass** |
| 6 | Collection Api | Account Status Check | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/accountholder/{accountHolderIdType}/{accountHolderId}/active` | 200 OK with active=true | Status: 200 -  | **Fail** |
| 7 | Collection Api | Account Balance Check | `https://sandbox.momodeveloper.mtn.com/collection/v1_0/account/balance` | 200 OK containing balance details | Status: 200. Content: {"availableBalance":"0","currency":"EUR"} | **Pass** |
| 8 | Disbursement Api | Token | `https://sandbox.momodeveloper.mtn.com/disbursement/token/` | 200 OK containing access_token | Status: 200. Token starts with: eyJ0eXAiOi... | **Pass** |
| 9 | Disbursement Api | Transfer | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/transfer` | 202 Accepted | Status: 202. RefId: 765ad46a-b3c4-4237-b5b5-ad74b67a809f | **Pass** |
| 10 | Disbursement Api | Account Balance Check | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/account/balance` | 200 OK containing balance details | Status: 200. Content: {"availableBalance":"-25","currency":"EUR"} | **Pass** |
| 11 | Disbursement Api | Refund | `https://sandbox.momodeveloper.mtn.com/disbursement/v2_0/refund` | 202 Accepted | Status: 202. Refund RefId: 4ffeabfa-3e8e-41e6-8de7-b8cb92aa230c | **Pass** |
| 12 | Disbursement Api | Get Refund Status | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/refund/{referenceId}` | 200 OK containing refund status | Status: 200. Content: {"financialTransactionId":"1772727908","externalId":"RF_DST_789","amount":"20","currency":"EUR","payee":{"partyIdType":"PARTY_CODE","partyId":"81bfd732-2697-4040-a3c5-666fa0175137"},"payerMessage":"Refund Test","payeeNote":"Test refund note","status":"SUCCESSFUL"} | **Pass** |
| 13 | Disbursement Api | Get Api/ Transfer Status | `https://sandbox.momodeveloper.mtn.com/disbursement/v1_0/transfer/{referenceId}` | 200 OK containing transfer status | Status: 200. Content: {"amount":"50","currency":"EUR","financialTransactionId":"1022598556","externalId":"TX_DST_456","payee":{"partyIdType":"MSISDN","partyId":"250788888888"},"payerMessage":"Transfer Test","payeeNote":"Test payee note","status":"SUCCESSFUL"} | **Pass** |
