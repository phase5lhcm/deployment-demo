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

# Set the ENTRYPOINT to always run the JAR file
ENTRYPOINT ["java", "-jar", "github-actions-demo.jar"]

# CMD to use environment variables for profile and datasource
CMD ["-Dspring.profiles.active=${ACTIVE_PROFILE}", "-Dspring.datasource.url=${DB_URL}", "github-actions-demo-${JAR_VERSION}.jar"]
