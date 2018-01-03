FROM debian:jessie
MAINTAINER Carles Amigó, fr3nd@fr3nd.net

RUN apt-get update && apt-get install -y \
      libdbd-mysql-perl \
      libdbi-perl \
      libio-socket-ssl-perl \
      libterm-readkey-perl \
      perl \
      wget \
      && rm -rf /usr/share/doc/* && \
      rm -rf /usr/share/info/* && \
      rm -rf /tmp/* && \
      rm -rf /var/tmp/*

ENV PERCONA_VERSION 3.0.5

WORKDIR /tmp

RUN wget https://www.percona.com/downloads/percona-toolkit/3.0.5/binary/debian/jessie/x86_64/percona-toolkit_3.0.5-1.jessie_amd64.deb && \
    dpkg -i percona-toolkit_3.0.5-1.jessie_amd64.deb && \
    rm -f percona-toolkit_3.0.5-1.jessie_amd64.deb

WORKDIR /
