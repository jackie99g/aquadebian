FROM debian:bookworm

WORKDIR /home

RUN apt-get update && apt-get install -y \
    build-essential \
    gdb \
    lcov \
    pkg-config \
    libbz2-dev \
    libffi-dev \
    libgdbm-dev \
    libgdbm-compat-dev \
    liblzma-dev \
    libncurses5-dev \
    libreadline6-dev \
    libsqlite3-dev \
    libssl-dev \
    lzma \
    lzma-dev \
    tk-dev \
    uuid-dev \
    zlib1g-dev \
    wget \
    uuid-runtime \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home

RUN wget https://www.python.org/ftp/python/3.13.0/Python-3.13.0.tgz && \
    tar -xf Python-3.13.0.tgz && \
    rm Python-3.13.0.tgz && \
    cd Python-3.13.0 && \
    ./configure --enable-optimizations  --with-lto && \
    make -j4 && \
    make install && \
    python3.13 --version && \
    cd /home && \
    rm -rf Python-3.13.0

WORKDIR /home

RUN wget https://nodejs.org/dist/v22.12.0/node-v22.12.0.tar.gz && \
    tar -xf node-v22.12.0.tar.gz && \
    rm node-v22.12.0.tar.gz && \
    cd node-v22.12.0 && \
    ./configure && \
    make -j4 && \
    make install && \
    node --version && \
    cd /home && \
    rm -rf node-v22.12.0
