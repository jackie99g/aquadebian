FROM debian:bookworm

WORKDIR /home

RUN apt-get update

RUN apt-get install -y build-essential gdb lcov pkg-config libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev lzma lzma-dev tk-dev uuid-dev zlib1g-dev wget uuid-runtime

RUN wget https://www.python.org/ftp/python/3.12.0/Python-3.12.0.tgz

RUN tar -xf Python-3.12.0.tgz

RUN rm Python-3.12.0.tgz

WORKDIR Python-3.12.0

RUN ./configure --enable-optimizations

RUN make -j4

RUN make install

RUN python3.12 --version

WORKDIR /home

RUN wget https://nodejs.org/dist/v21.2.0/node-v21.2.0.tar.gz

RUN tar -xf node-v21.2.0.tar.gz

RUN rm node-v21.2.0.tar.gz

WORKDIR node-v21.2.0

RUN ./configure

RUN make -j4

RUN make install

RUN node --version
