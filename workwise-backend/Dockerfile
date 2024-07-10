FROM ghcr.io/graalvm/graalvm-ce:ol8-java17-22.3.0 as build

WORKDIR /app

RUN microdnf install -y maven

RUN gu install native-image

COPY pom.xml .

RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn package -Pnative -DskipTests

RUN ls -l /app/target

FROM alpine:latest

RUN apk add --no-cache openjdk17

WORKDIR /app

COPY --from=build /app/target/communications-bffe-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

CMD ["java", "-jar", "communications-bffe-0.0.1-SNAPSHOT.jar"]

