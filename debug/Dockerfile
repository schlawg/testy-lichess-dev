FROM --platform=linux/amd64 ubuntu:latest

RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    software-properties-common \
    build-essential \
    python3 \
    python3-pip \
    python3-venv \
    dnsutils \
    unzip \
    git \
    jq \
    net-tools \
    redis-tools \
    tcpdump \
    zsh

RUN add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && apt-get install -y openjdk-21-jdk

RUN curl -fsSL https://pgp.mongodb.com/server-8.0.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-server-8.0.gpg && \
    echo "deb [ arch=amd64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/8.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-8.0.list && \
    apt-get update && apt-get install -y mongodb-mongosh mongodb-database-tools && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"
ENV NVM_DIR="/root/.nvm"
ENV PATH="$JAVA_HOME/bin:/root/.local/share/coursier/bin:$NVM_DIR/versions/node/v22.8.0/bin:$PATH"

RUN curl -fL "https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz" | \
    gzip -d > cs && \
    chmod +x cs && \
    ./cs setup -y && \
    ./cs install scala scalac scala-cli ammonite sbt sbtn bloop scalafmt && \
    rm cs

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash && \
    echo 'export NVM_DIR="/root/.nvm"' >> /etc/profile.d/nvm.sh && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> /etc/profile.d/nvm.sh && \
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> /etc/profile.d/nvm.sh && \
    bash -c "source /etc/profile.d/nvm.sh && nvm install 22.8.0"

RUN corepack enable
RUN node -v && npm -v

WORKDIR /ws

CMD ["/bin/bash"]
