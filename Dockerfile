FROM openjdk:11-jre-slim
EXPOSE 8081
ADD /target/docker-jenkins-integration-0.0.1-SNAPSHOT.jar docker-jenkins-integration-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","docker-jenkins-integration-0.0.1-SNAPSHOT.jar"]
