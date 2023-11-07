FROM sbtscala/scala-sbt:eclipse-temurin-jammy-21_35_1.9.7_3.3.1

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | NVM_DIR=/usr/local/nvm bash \
  && . /usr/local/.nvm/nvm.sh \
  && nvm install node \
  && npm install -g pnpm

ENV NVM_DIR=/usr/local/nvm
ENV PATH=$NVM_DIR/versions/node/20.2.0/bin:$PATH

WORKDIR /lila
ENTRYPOINT ./lila run
