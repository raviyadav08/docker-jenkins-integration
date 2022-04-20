#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /docker-jenkins-integration/src
COPY pom.xml /docker-jenkins-integration
RUN mvn -f /docker-jenkins-integration/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build /docker-jenkins-integration/target/docker-jenkins-integration-0.0.1-SNAPSHOT.jar /usr/local/lib/docker-jenkins-integration-0.0.1-SNAPSHOT.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/usr/local/lib/docker-jenkins-integration-0.0.1-SNAPSHOT.jar"]