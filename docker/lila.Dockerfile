FROM sbtscala/scala-sbt:eclipse-temurin-jammy-21_35_1.9.7_3.3.1
# sbtscala/scala-sbt:eclipse-temurin-focal-17.0.5_8_1.8.2_3.2.2
# RUN apt-get update && \
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | NVM_DIR=/usr/local/nvm bash \
  && . /usr/local/.nvm/nvm.sh \
  && nvm install node \
  && npm install -g pnpm

ENV NVM_DIR=/usr/local/nvm
ENV PATH=$NVM_DIR/versions/node/$(nvm version stable)/bin:$PATH

WORKDIR /lila
ENTRYPOINT ./lila run
