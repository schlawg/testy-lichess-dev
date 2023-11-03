FROM sbtscala/scala-sbt:eclipse-temurin-jammy-21_35_1.9.7_3.3.1
# sbtscala/scala-sbt:eclipse-temurin-focal-17.0.5_8_1.8.2_3.2.2
RUN apt-get update && \
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash && \
  source ~/.bashrc && \
  nvm install node && \
  && npm install -g pnpm

WORKDIR /lila
ENTRYPOINT ./lila run
