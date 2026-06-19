# Integrated Management Information & E-Commerce System
## Backend API Reference & Frontend Integration Guide

This document serves as the developer contract and endpoint guide for building frontend applications (e.g., React, Vue, Mobile) against the **Luz Technology** enterprise backend.

---

## ⚙️ Core Configuration

* **Base API URL:** `http://localhost:8080`
* **Allowed Origin (CORS):** `http://localhost:5173` (Standard Vite React/Vue default port)
* **Allowed HTTP Methods:** `GET`, `POST`, `PUT`, `PATCH`, `DELETE`, `OPTIONS`
* **Allowed Headers:** `Authorization`, `Content-Type`, `X-Requested-With`, `Accept`, `Origin`
* **Static Assets (Product Images):** Served publicly via `http://localhost:8080/uploads/{fileName}`

### Standard Response Envelope (`ApiResponse<T>`)
All endpoints wrap their payloads in a unified JSON envelope:
```json
{
  "success": true, // boolean indicating success/failure
  "message": "Success", // Description message
  "data": { ... }, // Payload of type T (object, array, or null)
  "timestamp": "2026-06-18T14:30:00" // LocalDateTime stamp
}
```

### Authentication Header
Secured endpoints require a standard Bearer Token authorization header:
```http
Authorization: Bearer <your_jwt_token>
```

---

## 🔐 1. Authentication Context (`/api/auth`)

Publicly accessible authentication and session management endpoints.

### User Login
* **Endpoint:** `POST /api/auth/login`
* **Request Body:**
  ```json
  {
    "email": "customer@luztechnology.com",
    "password": "SecurePassword123!"
  }
  ```
* **Response (MFA Disabled):**
  ```json
  {
    "success": true,
    "message": "User logged in successfully",
    "data": {
      "token": "eyJhbG...",
      "refreshToken": "7c125dfb-...",
      "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "email": "customer@luztechnology.com",
      "firstName": "John",
      "lastName": "Doe",
      "roles": ["ROLE_CUSTOMER"],
      "type": "Bearer",
      "mfaRequired": false
    }
  }
  ```
* **Response (MFA Enabled):**
  If MFA is enabled in security configurations, the token will be omitted, and the user must submit the OTP sent to their email.
  ```json
  {
    "success": true,
    "message": "MFA verification required",
    "data": {
      "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "email": "customer@luztechnology.com",
      "firstName": "John",
      "lastName": "Doe",
      "roles": ["ROLE_CUSTOMER"],
      "mfaRequired": true,
      "mfaToken": "mfa_temp_verification_token_here"
    }
  }
  ```

### Verify MFA (OTP)
* **Endpoint:** `POST /api/auth/mfa/verify`
* **Request Body:**
  ```json
  {
    "mfaToken": "mfa_temp_verification_token_here",
    "code": "123456"
  }
  ```
* **Response:** Returns the standard `AuthResponse` with JWT token.

### User Registration
* **Endpoint:** `POST /api/auth/register`
* **Request Body:**
  ```json
  {
    "firstName": "John",
    "lastName": "Doe",
    "email": "customer@luztechnology.com",
    "password": "SecurePassword123!"
  }
  ```
* **Response:** `ApiResponse<string>` indicating successful creation (automatically assigned `ROLE_CUSTOMER`).

### Forgot Password
* **Endpoint:** `POST /api/auth/forgot-password`
* **Request Body:**
  ```json
  {
    "email": "customer@luztechnology.com"
  }
  ```

### Reset Password
* **Endpoint:** `POST /api/auth/reset-password`
* **Request Body:**
  ```json
  {
    "token": "token-from-email",
    "newPassword": "NewSecurePassword123!"
  }
  ```

### Refresh Token
* **Endpoint:** `POST /api/auth/refresh`
* **Request Body:**
  ```json
  {
    "refreshToken": "7c125dfb-..."
  }
  ```
* **Response `data`:**
  ```json
  {
    "accessToken": "new_jwt_token_here",
    "refreshToken": "7c125dfb-..."
  }
  ```

### Logout
* **Endpoint:** `POST /api/auth/logout`
* **Headers:** `Authorization: Bearer <token>`
* **Response:** Clears the user's active refresh token database entry.

---

## 👤 2. User Profile & Wishlist

All endpoints in this section require authentication.

### Get Profile
* **Endpoint:** `GET /api/users/profile`
* **Response `data`:** User profile information including addresses and phone number.

### Update Profile
* **Endpoint:** `PUT /api/users/profile`
* **Request Body:**
  ```json
  {
    "firstName": "John",
    "lastName": "Doe",
    "phoneNumber": "+250788000000",
    "address": "Kigali, Rwanda"
  }
  ```

### Get Wishlist
* **Endpoint:** `GET /api/wishlist`
* **Response `data`:** Array of wishlist items.

### Add to Wishlist
* **Endpoint:** `POST /api/wishlist/{productId}`

### Remove from Wishlist
* **Endpoint:** `DELETE /api/wishlist/{productId}`

### Check if Product is Wishlisted
* **Endpoint:** `GET /api/wishlist/check/{productId}`
* **Response `data`:** `true` or `false`

### Get Wishlist Recommendations
* **Endpoint:** `GET /api/wishlist/recommendations?limit=10`

---

## 🛍️ 3. Product Catalog & Reviews

### View All Products
* **Endpoint:** `GET /api/products` (Public)
* **Response `data`:** Array of product details including names, descriptions, images, prices, categories, and discounts.

### Get Product Categories
* **Endpoint:** `GET /api/products/categories` (Public)

### Search & Filter Products
* **Endpoint:** `GET /api/products/search` (Public)
* **Query Parameters:**
  * `name` (String, optional)
  * `categoryId` (UUID, optional)
  * `minPrice` (Decimal, optional)
  * `maxPrice` (Decimal, optional)
  * `status` (ProductStatus: `ACTIVE`, `INACTIVE`, `DRAFT`, optional)

### Get Product Details
* **Endpoint:** `GET /api/products/{id}` (Public)

### Get Product Reviews
* **Endpoint:** `GET /api/reviews/product/{productId}` (Public)

### Submit Product Review
* **Endpoint:** `POST /api/reviews/product/{productId}` (Auth required)
* **Request Body:**
  ```json
  {
    "rating": 5, // 1-5
    "comment": "Outstanding build quality and fast shipment."
  }
  ```

### Write/Manage Products (Staff Context)
*Requires `ROLE_ADMIN` or `ROLE_EMPLOYEE`*
* **Create Product:** `POST /api/products` (JSON payload)
* **Create Product with Image (Multipart Form):** `POST /api/products/upload`
  * Body parameters: `name`, `description`, `price`, `sku`, `status`, `categoryId`, `file` (Multipart file), `altText`.
* **Update Product:** `PUT /api/products/{id}`
* **Update Status:** `PATCH /api/products/{id}/status?status={ACTIVE|INACTIVE|DRAFT}`
* **Assign Category:** `PATCH /api/products/{id}/category/{categoryId}`
* **Apply Discount:** `PATCH /api/products/{id}/discount/{discountId}`
* **Remove Image:** `PATCH /api/products/{id}/remove-image/{imageId}`
* **Add Image:** `POST /api/products/{id}/images` (Form data: `file`, `altText`, `isPrimary`)
* **Delete Product:** `DELETE /api/products/{id}` (Requires `ROLE_ADMIN`)

### Bulk Product Import/Export
*Requires `ROLE_ADMIN` or `ROLE_EMPLOYEE`*
* **Import CSV/Excel:** `POST /api/products/bulk/import` (Form data: `file`)
* **Export Products:** `GET /api/products/bulk/export` (Returns downloadable file)

### Discount Codes Configuration
*Requires `ROLE_ADMIN` or `ROLE_EMPLOYEE`*
* **List Active Discounts:** `GET /api/products/discounts`
* **Create Discount Code:** `POST /api/products/discounts`
* **Toggle Discount State:** `PATCH /api/products/discounts/{id}/toggle`
* **Delete Discount Code:** `DELETE /api/products/discounts/{id}`

---

## 🛒 4. Shopping Cart

All cart operations require `ROLE_CUSTOMER` authentication.

### View Cart
* **Endpoint:** `GET /api/cart`
* **Response `data`:** Detailed cart structure including total price, total items, and item details (product name, price, subtotal, and quantity).

### Add Item to Cart
* **Endpoint:** `POST /api/cart/items`
* **Request Body:**
  ```json
  {
    "productId": "8f876878-5717-4562-b3fc-2c963f66afa6",
    "quantity": 2
  }
  ```

### Update Item Quantity
* **Endpoint:** `PATCH /api/cart/items/{productId}?quantity=5`

### Remove Item from Cart
* **Endpoint:** `DELETE /api/cart/items/{productId}`

### Clear Cart
* **Endpoint:** `DELETE /api/cart`

### Checkout from Cart
* **Endpoint:** `POST /api/cart/checkout`
* **Request Body:**
  ```json
  {
    "shippingAddress": "123 Main St, Kigali",
    "billingAddress": "123 Main St, Kigali", // optional
    "paymentMethod": "MTN_MOMO" // BK_CARD, PAYPAL, AIRTEL_MONEY, MTN_MOMO
  }
  ```
* **Response `data`:** Returns the created `Order` object.

---

## 📦 5. Order Pipeline, Shipments & Returns

### Create Custom Order Direct
* **Endpoint:** `POST /api/orders` (Auth required, `ROLE_CUSTOMER`)
* **Request Body:**
  ```json
  {
    "items": [
      {
        "productId": "8f876878-5717-4562-b3fc-2c963f66afa6",
        "quantity": 1,
        "unitPrice": 450.00
      }
    ],
    "shippingAddress": "Kigali, Rwanda",
    "billingAddress": "Kigali, Rwanda",
    "totalAmount": 450.00,
    "paymentMethod": "BK_CARD"
  }
  ```

### View Customer Orders
* **Endpoint:** `GET /api/orders/customer/{customerId}` (Auth required)

### Get Order Details
* **Endpoint:** `GET /api/orders/{id}` (Auth required)

### Cancel Order
* **Endpoint:** `POST /api/orders/{id}/cancel` (Customer or Admin)

### Order Status Flow (Staff Context)
*Requires `ROLE_ADMIN` or `ROLE_EMPLOYEE`*
* **Update Status:** `PATCH /api/orders/{id}/status?status={status}`
  * Status options: `CREATED`, `PAID`, `PICKED`, `PACKED`, `DISPATCHED`, `DELIVERED`, `CANCELLED`
* **List All Orders:** `GET /api/orders`

### Return Requests
* **Create Return:** `POST /api/returns` (Auth required)
* **Get Returns by Order:** `GET /api/returns/order/{orderId}`
* **Approve Return:** `POST /api/returns/{id}/approve` (Staff)
* **Reject Return:** `POST /api/returns/{id}/reject` (Staff)
* **Process Refund:** `POST /api/returns/{id}/refund` (Staff)
* **Refund Status Check:** `POST /api/returns/{id}/refund/status`
* **Complete Return Request:** `POST /api/returns/{id}/complete` (Staff)

### Shipment Management
* **Get Shipments by Order:** `GET /api/shipments/order/{orderId}`
* **Track Shipment:** `GET /api/shipments/track/{trackingNumber}`
* **Update Shipment Status:** `PATCH /api/shipments/{id}/status` (Staff)
* **Cancel Shipment:** `POST /api/shipments/{id}/cancel` (Staff)

### Order Receipts & Invoices
* **View Invoice JSON:** `GET /api/receipts/orders/{orderId}`
* **Download PDF Invoice:** `GET /api/receipts/orders/{orderId}/pdf` (Returns PDF byte array)

---

## 💳 6. Payments & Webhooks

### Initiate Payment Session
* **Endpoint:** `POST /api/payments/initiate/{orderId}` (Auth required)
* **Response `data`:** Contains payment reference and target payment gateway URL (if applicable).

### Payment Gateway Webhooks
* **Endpoint:** `POST /api/payments/webhook/{provider}` (Public)
  * `provider` can be: `paypal`, `mtn`, `airtel`, `bkcard`.
  * Used by payment gateways to notify the system of transaction status.

### MTN Mobile Money Sandbox Runner
* **Endpoint:** `POST /api/payments/mtn/run-tests` (Public, for local Sandbox emulation testing)

### Payment Reconciliation (Finance Context)
*Requires `ROLE_ADMIN` or `ROLE_EMPLOYEE`*
* **List Transactions:** `GET /api/payments/reconciliation/transactions`
* **Get Financial Summary:** `GET /api/payments/reconciliation/summary`
* **Update Transaction details:** `PATCH /api/payments/reconciliation/transactions/{id}`
* **Trigger Reconciliation Engine:** `PATCH /api/payments/reconciliation/run`

---

## 💬 7. Support, FAQ & Live Chat

### Knowledge Base & FAQs
* **List Published FAQs:** `GET /api/support/knowledge-base/faqs?category=general` (Public)
* **Get Article Detail:** `GET /api/support/knowledge-base/faqs/{id}` (Public)
* **Manage FAQ Articles:** `POST|PUT|DELETE /api/support/knowledge-base/faqs/**` (Staff only)

### Support Tickets
* **Create Ticket:** `POST /api/support/tickets` (Auth required, `ROLE_CUSTOMER`)
  * Body: `{ "title": "...", "description": "...", "priority": "LOW|MEDIUM|HIGH" }`
* **Get My Tickets:** `GET /api/support/tickets/my` (Customer)
* **Ticket Messages:** `GET|POST /api/support/tickets/{id}/messages` (Customer & Staff)
* **Close Ticket:** `PATCH /api/support/tickets/{id}/close` (Customer & Staff)
* **Submit Customer Satisfaction Survey:** `POST /api/support/tickets/{id}/survey`
  * Body: `{ "rating": 5, "feedback": "Optional comments" }`
* **Staff Controls (Assign, List All):** `GET /api/support/tickets`, `PATCH /api/support/tickets/{id}/assign`

### Live Chat & WebSocket Channels
Real-time messaging is implemented via STOMP WebSockets.

#### 🔗 WebSocket Connection Setup
* **Connection URL:** `ws://localhost:8080/ws` (or `http://localhost:8080/ws` using SockJS client)
* **Allowed Origin:** All origins checked via handshake.

#### 📡 STOMP Destinations
1. **Subscribe (Listen for incoming messages):**
   * `/topic/live-chat/{sessionId}` (Broadcast channel for the active session chat room)
2. **Publish (Send new message via WebSocket):**
   * Destination: `/app/live-chat/{sessionId}/send`
   * Body Payload:
     ```json
     {
       "senderId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
       "message": "Hello, I am seeking support regarding my recent delivery."
     }
     ```

#### 🌐 HTTP Live Chat Fallback/Management
* **Create Chat Session:** `POST /api/support/live-chat/sessions` (Customer)
  * Body: `{ "subject": "Shipment Delay", "openingMessage": "Hello, my order is late" }`
* **Get Session Messages:** `GET /api/support/live-chat/sessions/{sessionId}/messages`
* **Send Session Message (HTTP Alternative):** `POST /api/support/live-chat/sessions/{sessionId}/messages`
  * Body: `{ "message": "My query is resolved." }`
* **Close Chat Session:** `POST /api/support/live-chat/sessions/{sessionId}/close`
* **Staff Controls (List, Assign):** `GET /api/support/live-chat/sessions`, `POST /api/support/live-chat/sessions/{sessionId}/assign`

---

## 🛡️ 8. Administration & Audit Logs

*All endpoints in this section require `ROLE_ADMIN` access.*

### User & Role Management
* **List Users:** `GET /api/admin/users`
* **List Roles:** `GET /api/admin/roles`
* **Assign Role:** `POST /api/admin/users/{userId}/roles` (Body: String role name)
* **Update Roles:** `PUT /api/admin/users/{userId}/roles` (Body: List of role names)
* **Revoke Role:** `DELETE /api/admin/users/{userId}/roles/{roleName}`

### Security Configuration
* **Get Security Policies:** `GET /api/admin/security-settings`
* **Update Security Policies (e.g., MFA requirements, Lockout thresholds):** `PUT /api/admin/security-settings`
* **Unlock User Account:** `POST /api/admin/security-settings/users/{userId}/unlock`

### Audit & Security Logs
* **Retrieve Security Audits:** `GET /api/admin/audit`
* **Search / Filter Audits:** `GET /api/admin/audit/search`

### Backup & Database Maintenance
* **List Backups:** `GET /api/admin/backups`
* **Download Backup File:** `GET /api/admin/backups/{id}`
* **Trigger System Backup:** `POST /api/admin/backup`
* **Restore Backup State:** `POST /api/admin/backups/{id}/restore`

### System Configurations
* **List All Config Keys:** `GET /api/admin/configurations`
* **Add/Update Config:** `PUT /api/admin/configurations/{key}` (Body: String value)
* **Delete Config:** `DELETE /api/admin/configurations/{key}`

---

## 📈 9. Analytics, CRM & Inventory Context

*All endpoints require `ROLE_ADMIN` or `ROLE_EMPLOYEE` (Staff) access.*

### Dashboard KPIs
* **Get Sales Analytics:** `GET /api/analytics/sales`
* **Get Revenue Aggregations:** `GET /api/analytics/revenue`
* **General Dashboard Summary:** `GET /api/analytics/dashboard`
* **Main KPI Aggregator:** `GET /api/analytics/dashboard/kpis`
* **CRM Customer Metrics:** `GET /api/analytics/customers`
* **Support Response Metrics:** `GET /api/analytics/support`

### Reports & Document Export
* **Finance Sales Reports:** `GET /api/reports/sales`
* **Generate PDF Invoice:** `GET /api/reports/invoices/{orderId}`

### Inventory & Stock Operations
* **List Inventory Items:** `GET /api/inventory`
* **Get Low Stock Items:** `GET /api/inventory/low-stock`
* **Adjust Stock Levels:** `POST /api/inventory/{id}/adjust` (Body: `{ "quantity": -5, "reason": "Damaged stock" }`)
* **Configure Supplier details:** `POST|PUT /api/inventory/suppliers`
* **Procurement Pipeline (Purchase Orders):** `POST|PATCH /api/inventory/procurements`

### Point of Sale (POS) Context
* **Record Counter Checkout:** `POST /api/pos/checkout`
* **Retrieve POS Invoice:** `GET /api/pos/receipts/{orderId}`
