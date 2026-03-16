# Integrated Management Information & E-Commerce System

## Architecture Overview
This is a production-ready enterprise backend built for **Luz Technology**. It handles full-scale e-commerce, CRM, inventory, and administrative capabilities wrapped elegantly into modular bounded contexts. 
It follows **Clean Architecture** and bounded DDD context principles.

## Tech Stack
* **Java 17** + **Spring Boot 3.5.x**
* **Spring Security 6** (JWT & Google OAuth2)
* **Spring Data JPA** (Hibernate 6)
* **PostgreSQL** Database
* **Swagger/OpenAPI 3** documentation
* **MapStruct** for high-performance DTO mapping
* **Lombok** 
* **Global Exception Handling**

## Modularity structure
1. **auth & security**: Registration, multi-factor prep, login (OAuth & JWT), filters and token handling.
2. **user**: Core Role/User Entities.
3. **inventory**: Stock movement, low-stock triggers, procurement handling.
4. **product**: Categories, product lifecycle tracking.
5. **order**: Order pipelines (`CREATED` -> `SHIPPED`), order items, status tracking.
6. **payment**: Payment integrations injected dynamically using the *Strategy Pattern* (PayPal, MTN, Airtel, BKCard).
7. **analytics / crm**: Advanced aggregations, profile segmentation, and KPIs.
8. **finance / support / admin**: Business logic handling back-office requirements.

## How to Set Up & Run

### 1. Configure the Database
Create a PostgreSQL database called `luz_db` and a user `postgres` with your desired credentials, configuring them inside `src/main/resources/application.yml`.

### 2. Environment Variables
Inject Google OAuth details:
* `GOOGLE_CLIENT_ID`
* `GOOGLE_CLIENT_SECRET`

### 3. Build & Run
To run locally using Maven wrapper:
```bash
./mvnw clean install
./mvnw spring-boot:run
```

### 4. API Documentation
Once running, check out the endpoints securely via Swagger UI:
`http://localhost:8080/swagger-ui.html`
