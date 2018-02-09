FROM ubuntu:16.04
MAINTAINER AntonioCesar <jrcesar4@gmail.com>
COPY redis-3.2.10.tar.gz /
RUN apt-get moo;
RUN apt-get update && apt-get install -y \
    aufs-tools \
    automake \
    build-essential \
    libcap-dev \
    ruby2.3 \
    ruby2.3-dev \
    rubygems \
    bundler \
    tk8.5 \
    vim \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get clean -yqq
RUN tar -xzvf redis-3.2.10.tar.gz
RUN cd redis-3.2.10 && make install
RUN gem install redis
COPY startredis.sh /usr/bin
RUN chmod +x /usr/bin/startredis.sh
ENTRYPOINT startredis.sh && /bin/bash
EXPOSE 30001 30002 30003 30004 30005 30006