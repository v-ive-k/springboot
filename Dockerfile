# 1. Use the official Maven image to build the application
FROM maven:3.9.4-eclipse-temurin-17 AS build

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy the pom.xml and source code to the container
COPY pom.xml .
COPY src ./src

# 4. Package the application using Maven
RUN mvn clean package -DskipTests

# 5. Use the official OpenJDK image to run the application
FROM eclipse-temurin:17-jdk-alpine

# 6. Set the working directory inside the container
WORKDIR /app

# 7. Copy the JAR file from the build stage
COPY --from=build /app/target/boot-1.0.jar app.jar

# 8. Expose port 8080
EXPOSE 8081

# 9. Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
