FROM node:20 AS node

FROM sbtscala/scala-sbt:eclipse-temurin-jammy-21_35_1.9.7_3.3.1

COPY --from=node /usr/local/bin /usr/local/bin
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/share /usr/local/share


RUN corepack enable

WORKDIR /lila
ENTRYPOINT ./lila run
