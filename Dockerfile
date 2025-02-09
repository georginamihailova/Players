# Using the official Maven image to build the application
FROM maven AS build
WORKDIR /app

# Copy the project files
COPY . .

# Package the application
RUN mvn clean package -DskipTests

# Using fficial OpenJDK image for the runtime
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy the packaged application from the build stage
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar /app/demo.jar



# Define the command to run the application
ENTRYPOINT ["java", "-jar", "/app/demo.jar"]
