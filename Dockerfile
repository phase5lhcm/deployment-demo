# Build stage
FROM openjdk:17-jdk-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file to the container
COPY target/github-actions-demo.jar /app/github-actions-demo.jar

# Expose the port the application will run on
EXPOSE 8080

# Set environment variables (fixed typos)
ENV DB_URL=${DB_CONTAINER_NAME_URL}
ENV ACTIVE_PROFILE=${PROFILE}
ENV JAR_VERSION=${APP_VERSION}

# Use ENTRYPOINT to run the Java application with necessary environment variables
ENTRYPOINT ["java", "-Dspring.profiles.active=${ACTIVE_PROFILE}", "-Dspring.datasource.url=${DB_URL}", "-jar", "github-actions-demo-${JAR_VERSION}.jar"]