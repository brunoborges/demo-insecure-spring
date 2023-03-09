FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu as BUILD

COPY pom.xml /app/pom.xml
COPY src /app/src
COPY mvnw /app/mvnw
COPY .mvn /app/.mvn
RUN cd /app && ./mvnw package

FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu
COPY --from=BUILD /app/target/*.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]
