FROM openjdk:17
WORKDIR /app
COPY target/*.jar .
RUN mvn clean install
EXPOSE 1002
CMD ["java", "-jar", "*.jar"]
