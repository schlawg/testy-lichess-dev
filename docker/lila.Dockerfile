FROM sbtscala/scala-sbt:eclipse-temurin-jammy-21_35_1.9.7_3.3.1

ARG NODE_VERSION=20.2.0

RUN cd /usr/local && \
    curl -SLO "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz" && \
    tar --strip-components=1 -xJf "node-v${NODE_VERSION}-linux-x64.tar.xz" && \
    rm "node-v${NODE_VERSION}-linux-x64.tar.xz" && \
    ln -s /usr/local/bin/node /usr/bin/node && \
    ln -s /usr/local/bin/npm /usr/bin/npm && \
    ln -s /usr/local/bin/npx /usr/bin/npx

RUN npm install -g pnpm

WORKDIR /lila
ENTRYPOINT ./lila run
