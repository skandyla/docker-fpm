FROM       debian:jessie
MAINTAINER Sergey Kandyla <skandyla@gmail.com>

RUN echo "===> Installing tools..."  && \
    apt-get -y update && \
    apt-get -y install ruby ruby-dev rubygems gcc make rpm && \
    \
    echo "===> Installing fpm..." && \
    gem install --no-ri --no-rdoc fpm && \
    \
    echo "===> Cleaning the system..." && \
    apt-get -f -y --auto-remove remove gcc make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["fpm"]
