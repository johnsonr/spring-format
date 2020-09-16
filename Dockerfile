FROM openjdk:8

WORKDIR /atm/java

COPY /target/spring-format-0.1.0-SNAPSHOT-jar-with-dependencies.jar .
COPY commit.json .
COPY run.sh .

ENTRYPOINT ["/atm/java/run.sh"]
