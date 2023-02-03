FROM maven:3.8-jdk-11 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM gcr.io/distroless/java
COPY --from=build /usr/src/app/target/maven-template-repo-*-with-dependencies.jar /usr/app/app.jar
ENTRYPOINT ["java","-jar","/usr/app/app.jar"]
