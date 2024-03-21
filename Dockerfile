FROM openjdk:17

LABEL maintainer="tinyfingers"

WORKDIR /app

COPY target/spring-petclinic-3.2.0-SNAPSHOT.jar /app/spring-petclinic-3.2.0-SNAPSHOT.jar

EXPOSE 8888

CMD ["java", "-jar", "spring-petclinic-3.2.0-SNAPSHOT.jar"]
