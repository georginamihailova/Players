FROM maven AS build
WORKDIR /app


COPY . .


RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /app

COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar /app/demo.jar



ENTRYPOINT ["java", "-jar", "/app/demo.jar"]
