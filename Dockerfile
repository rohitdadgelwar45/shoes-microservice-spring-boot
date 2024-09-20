FROM openjdk:17
WORKDIR /app
COPY target/*.jar .
RUN maven clean package
EXPOSE 1002
CMD ["java", "-jar", "*.jar"]
