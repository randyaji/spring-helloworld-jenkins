FROM openjdk:latest
LABEL maintainer="randyaji.ra@gmail.com"
COPY ./target/*.jar /home/demo-0.0.1-SNAPSHOT.jar
CMD ["java","-jar","/home/demo-0.0.1-SNAPSHOT.jar"]