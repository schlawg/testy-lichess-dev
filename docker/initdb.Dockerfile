FROM openjdk:slim
COPY --from=python:3 / /
RUN pip3 install --no-cache-dir -r pymongo
WORKDIR /lila-db-seed