FROM ubuntu:vivid

ENV NETPERF_VERSION=2.6.0 \
  NETPERF_DIR=/usr/src/netperf

EXPOSE 12865/tcp
EXPOSE 12865/udp

RUN apt-get update && apt-get install -y --no-install-recommends \
  gcc \
  build-essential \
  make \
  curl \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sSL ftp://ftp.netperf.org/netperf/netperf-${NETPERF_VERSION}.tar.gz | tar -xz; \
  mv netperf-${NETPERF_VERSION} ${NETPERF_DIR}

RUN cd ${NETPERF_DIR} \
  && ./configure \
  && make install \
  && make clean

