FROM sbtscala/scala-sbt:eclipse-temurin-focal-17.0.5_8_1.8.2_3.2.2

RUN apt-get update && \
  curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh && \
  bash nodesource_setup.sh && \
  apt-get install -y nodejs && \
  npm install -g pnpm

WORKDIR /lila
ENTRYPOINT ./lila run
