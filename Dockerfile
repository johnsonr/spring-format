FROM openjdk:8@sha256:55999543690e4016cadc292ae131dabc07edcf7dd9597d7e8e4d4fb6b1c1dddf

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
