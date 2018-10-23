FROM       openjdk:jre-alpine
LABEL      maintainer="CHANGE_ME"

RUN        mkdir -p /app/jar
WORKDIR    /app/jar
ADD        jars/hello-0.0.1.jar hello.jar

EXPOSE     8080
ENTRYPOINT ["java", "-jar", "hello.jar"]