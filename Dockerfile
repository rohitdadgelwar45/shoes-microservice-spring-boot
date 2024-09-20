FROM maven:3.8.1-openjdk-11

WORKDIR /app
COPY . .
RUN mvn clean package
EXPOSE 1002
CMD ["java", "-jar", "target/your-app.jar"]
