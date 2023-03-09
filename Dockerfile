FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu as BUILD

COPY pom.xml /app/pom.xml
COPY src /app/src
COPY mvnw /app/mvnw
COPY .mvn /app/.mvn
RUN cd /app && chmod a+x mvnw && ./mvnw package

FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu
COPY --from=BUILD /app/target/*.jar /app.jar

# Stay on an older version of JDK 17 (17.0.5-1) to test security alerts
RUN apt update && apt-cache madison msopenjdk-17 && apt install -y msopenjdk-17=17.0.5-1

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]
