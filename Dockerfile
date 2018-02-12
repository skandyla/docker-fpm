FROM       debian:jessie
MAINTAINER Sergey Kandyla <skandyla@gmail.com>

RUN echo "===> Installing tools..."  && \
    apt -y update && \
    apt -y install ruby ruby-dev rubygems build-essential autoconf libtool && \
    \
    echo "===> Installing fpm..." && \
    gem install --no-ri --no-rdoc fpm && \
    \
    echo "===> Cleaning the system..." && \
    apt -f -y --auto-remove remove build-essential autoconf libtool && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["fpm"]
