FROM amd64/eclipse-temurin:21-jdk-jammy
COPY --from=python:3 / /
RUN pip3 install --no-cache-dir -r pymongo
WORKDIR /lila-db-seed