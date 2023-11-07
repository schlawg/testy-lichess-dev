FROM sbtscala/scala-sbt:eclipse-temurin-jammy-21_35_1.9.7_3.3.1

RUN apt-get update && \
    apt-get install -y nodejs npm && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g pnpm

WORKDIR /lila
ENTRYPOINT ./lila run
