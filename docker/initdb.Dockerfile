FROM eclipse-temurin:21-jdk-jammy

# Install Python
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install pymongo
RUN pip3 install --no-cache-dir pymongo

# Set the working directory
WORKDIR /lila-db-seed
