FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu

ADD target/demo-0.0.1-SNAPSHOT.jar /app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app.jar"]