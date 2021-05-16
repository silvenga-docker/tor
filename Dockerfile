FROM debian:buster

LABEL maintainer "Mark Lopez <m@silvenga.com>"
LABEL org.opencontainers.image.source https://github.com/silvenga-docker/tor

RUN set -xe \
    && apt-get update \
    && apt-get install -y apt-transport-https wget gnupg2 \
    && wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | apt-key add - \
    && echo "deb [arch=amd64] https://deb.torproject.org/torproject.org buster main" > /etc/apt/sources.list.d/tor \
    && apt-get install -y tor obfs4proxy \
    && apt-get purge wget -y apt-transport-https gnupg2 \
    && apt-get autoremove -y --purge \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && tor --version

CMD [ "tor" ]
