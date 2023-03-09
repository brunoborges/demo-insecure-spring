FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu

# Stay on an older version of JDK 17 (17.0.5-1) to test security alerts
RUN apt update && apt-cache madison msopenjdk-17 && apt install -y --allow-downgrades msopenjdk-17=17.0.5-1

# Copy application JAR
COPY target/*.jar /app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app.jar"]
