FROM debian:buster-slim

# Install Python
RUN apt-get update && \
    apt-get install -y make python3 python3-pip

# Install pymongo
RUN pip3 install --no-cache-dir requests pymongo

# Set the working directory
WORKDIR /lila-db-seed
