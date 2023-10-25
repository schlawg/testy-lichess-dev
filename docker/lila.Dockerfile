FROM sbtscala/scala-sbt:eclipse-temurin-jammy-21_35_1.9.7_3.3.1

RUN apt-get update && \
  curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh && \
  bash nodesource_setup.sh && \
  apt-get install -y nodejs && \
  npm install -g pnpm

WORKDIR /lila
ENTRYPOINT ./lila run
