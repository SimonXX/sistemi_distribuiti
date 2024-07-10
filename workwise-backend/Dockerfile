# Use the official GraalVM JDK 17 image to build the application
FROM ghcr.io/graalvm/graalvm-ce:ol8-java17-22.3.0 as build

# Set the working directory
WORKDIR /app

# Install necessary tools
RUN microdnf install -y maven

# Install native-image component
RUN gu install native-image

# Copy the Maven project files
COPY pom.xml .

# Download the project dependencies
RUN mvn dependency:go-offline -B

# Copy the rest of the project files
COPY src ./src

# Package the application
RUN mvn package -Pnative -DskipTests

# Verify the generated JAR file
RUN ls -l /app/target

# Use a smaller base image for the native executable
FROM alpine:latest

# Install Java (OpenJDK 17 in this case)
RUN apk add --no-cache openjdk17

# Set the working directory
WORKDIR /app

# Copy the native executable from the build stage
COPY --from=build /app/target/communications-bffe-0.0.1-SNAPSHOT.jar .

# Expose port 8080
EXPOSE 8080

# Run the native executable
CMD ["java", "-jar", "communications-bffe-0.0.1-SNAPSHOT.jar"]

