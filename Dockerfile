FROM openjdk:17
WORKDIR /app
COPY target/*.jar .
EXPOSE 1002
CMD ["java", "-jar", "*.jar"]
