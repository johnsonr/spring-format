FROM openjdk:8

RUN apt-get update && apt-get install -y \
        curl \
        wget \
        gnupg \
        build-essential \
        software-properties-common \
        && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0 \
    && apt-add-repository https://cli.github.com/packages \
    && apt-get update --allow-insecure-repositories \
    && apt-get install gh

WORKDIR /atm/java

COPY /target/spring-format-0.1.0-SNAPSHOT-jar-with-dependencies.jar .
COPY commit.json .
COPY run.sh .

ENTRYPOINT ["/atm/java/run.sh"]
