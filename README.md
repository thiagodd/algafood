# Algafood - API

## About the Project

**FoodApp API** is the backend for a food delivery system, designed to be scalable, secure, and efficient. The project was developed during the **Spring REST Specialist** course by Algaworks and serves as a practical and in-depth implementation of RESTful API concepts using the Spring ecosystem.

The system's architecture is based on a rich domain model with well-defined aggregates (such as `Restaurant`, `Order`, `User`), ensuring data consistency and integrity.


## Key Features

Based on the domain model, the API offers the following features:

* **Restaurant Management:**
    * Registration of restaurants with information such as name, freight fee, and address.
    * Association of restaurants with a `Cuisine` type (e.g., Italian, Japanese).
    * Management of `Payment Methods` accepted by each restaurant.
    * Activation and deactivation of restaurants.

* **Menu Management:**
    * Registration of `Products` associated with a restaurant, including name, description, price, and photo.
    * Activation and deactivation of products on the menu.

* **Complete Order System:**
    * Creation of `Orders` by customers.
    * Addition of multiple `Items` to an order, with quantity and notes.
    * Automatic calculation of subtotal, freight fee, and total amount.
    * Order status flow (`CREATED`, `CONFIRMED`, `DELIVERED`, `CANCELLED`).
    * Recording of important dates (creation, confirmation, delivery).

* **User and Security Management:**
    * Registration of `Users` (customers and other profiles).
    * Access control system based on `Groups` and `Permissions` (RBAC), allowing for different levels of authorization in the API.

* **Auxiliary Data Structure:**
    * Centralized management of `Cities`, `States`, `Payment Methods`, and `Cuisines`.

## Technologies Used

* **Language:** Java 17+
* **Framework:** Spring Boot
* **Data Access:** Spring Data JPA / Hibernate
* **Database:** MySQL 8
* **Dependency Manager:** Maven
* **Security:** Spring Security (for permission control)
* **Principles:** RESTful API, Domain-Driven Design (DDD)


## Prerequisites

- Java 17 (Adoptium/Temurin or Oracle/OpenJDK)
- Maven 3.9+ (or use the Maven Wrapper in this repo)
- Docker and Docker Compose (optional, for local MySQL)

Quick checks:

```bash
java -version
mvn -v
docker -v
docker compose version
```

## Database setup

You have two options:

### Option A: Run MySQL with Docker Compose (recommended for local dev)

This repository includes a Compose file that starts a MySQL 8 container with a persistent volume and exposes port 3306.

- Compose service name: `mysql-db`
- Image: `mysql:8.0.43-debian`
- Database name: `algafood`
- User: `root`
- Password: `password`
- Exposed port: `3306` (host) → `3306` (container)

Start the database:

```bash
# from the project root
docker compose up -d mysql-db
```

Verify it’s running:

```bash
docker compose ps
# optional logs
docker compose logs -f mysql-db
```

Optional: verify connectivity with the MySQL CLI (if installed):

```bash
mysql -h 127.0.0.1 -P 3306 -u root -ppassword -e "SHOW DATABASES;"
```

Port already in use? Either stop the conflicting service or change the host port in `docker-compose.yml` to something like `3307:3306`, and then update `spring.datasource.url` accordingly (see Option B).

### Option B: Use an existing/external MySQL server

Edit `src/main/resources/application.yml` to point to your MySQL host, port, database, and credentials.

Example:

```yaml
spring:
  datasource:
    url: jdbc:mysql://db-hostname-or-ip:3306/algafood?allowPublicKeyRetrieval=true&useSSL=false
    username: your_user
    password: your_password
```

Notes:
- The current config in `application.yml` is set to `jdbc:mysql://localhost:3306/algafood` with `root/password`, matching the provided Docker Compose setup.
- If your MySQL runs on a different port, update the URL (e.g., `jdbc:mysql://localhost:3307/algafood`).
- For MySQL 8 in certain environments, you may need `allowPublicKeyRetrieval=true` and `useSSL=false` for local dev.

### Schema management and seed data

The project is configured with:

```yaml
spring:
  jpa:
    hibernate:
      ddl-auto: create
```

This means the schema is recreated on each startup. An `import.sql` file exists at `src/main/resources/import.sql`; when Hibernate creates the schema, it will execute this file to seed data automatically. For persistent data between runs, consider changing `ddl-auto` to `update` or managing schema externally.

## Running the application

You can run the app using the Maven Wrapper or Maven itself. Ensure the database is reachable first (see Database setup).

### Run directly with Maven Wrapper

```bash
./mvnw spring-boot:run
```

If you are on Windows PowerShell:

```powershell
mvnw.cmd spring-boot:run
```

### Build an executable JAR and run it

```bash
./mvnw clean package
java -jar target/algafood-0.0.1-SNAPSHOT.jar
```

The application will start on http://localhost:8080 by default.

## Running tests

```bash
./mvnw test
```

## Troubleshooting

- Cannot connect to database
  - Ensure the container is up: `docker compose ps`
  - Match credentials in `application.yml` with your MySQL instance
  - Validate connectivity with a client: `mysql -h 127.0.0.1 -P 3306 -u root -ppassword`
- Port 3306 is already in use
  - Change the host port mapping in `docker-compose.yml` (e.g., `3307:3306`) and update `spring.datasource.url`
- Data is lost between restarts
  - With `ddl-auto: create`, the schema is dropped/created on each app start. Switch to `update` for persistence or manage schema outside the app

## Project structure

- `docker-compose.yml` — local MySQL container definition
- `src/main/resources/application.yml` — Spring configuration (DB URL, credentials, JPA)
- `src/main/resources/import.sql` — optional seed data executed when schema is created
- `src/main/java/...` — application code (controllers, services, repositories, domain)

## License

This project is for educational purposes.

