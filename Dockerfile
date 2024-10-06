# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Add the JAR file to the container (built from the GitHub Actions pipeline)
ADD target/github-actions-demo.jar github-actions-demo.jar

# Expose the port the application will run on
EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java", "-jar", "github-actions-demo.jar"]
