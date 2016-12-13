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

ENV PERCONA_VERSION 2.2.20



WORKDIR /tmp
RUN wget https://www.percona.com/downloads/percona-toolkit/2.2.20/deb/percona-toolkit_2.2.20-1_all.deb && \
    dpkg -i percona-toolkit_2.2.20-1_all.deb && \
    rm -f percona-toolkit_2.2.20-1_all.deb

WORKDIR /
