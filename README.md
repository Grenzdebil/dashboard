# Dashboard

## Overview

Dashboard is a Kotlin-based web application built with Spring Boot. It allows users to manage URLs and categorize them with tags. The application uses PostgreSQL for storage and jOOQ for database interactions. Code quality is maintained with `ktlint`.

## Features

- Save and manage URLs
- Tag URLs for categorization
- API for URL management
- Integrated code quality tools (`ktlint`)

## Technologies

- **Kotlin**
- **Spring Boot**
- **PostgreSQL**
- **jOOQ**
- **ktlint**

## Installation

### Prerequisites

- [Java JDK 21](https://www.oracle.com/java/technologies/javase-jdk21-downloads.html)
- [Docker](https://www.docker.com/products/docker-desktop)
- [Gradle](https://gradle.org/install/)

### Setup

1. **Clone the repository:**

    ```bash
    git clone https://github.com/your-username/dashboard.git
    cd dashboard
    ```

2. **Start PostgreSQL with Docker:**

    ```bash
    docker run --name postgres -e POSTGRES_DB=mydatabase -e POSTGRES_USER=myuser -e POSTGRES_PASSWORD=secret -p 5432:5432 -d postgres:latest
    ```

3. **Run the application:**

    ```bash
    ./gradlew bootRun
    ```

   Or build and run the JAR:

    ```bash
    ./gradlew build
    java -jar build/libs/dashboard-0.0.1-SNAPSHOT.jar
    ```

## API Endpoints

- **GET** `/urls` - Retrieve all URLs
- **POST** `/urls` - Add a new URL
- **GET** `/urls/{id}` - Retrieve a URL by ID
- **DELETE** `/urls/{id}` - Delete a URL by ID

## Code Quality

- **ktlint**: Run `./gradlew ktlintCheck` to check code style.

## Contributing

1. **Fork the repository.**
2. **Create a new branch for your changes.**
3. **Submit a Pull Request.**

## Contact

For questions, contact god
