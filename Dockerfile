FROM debian:bullseye

LABEL maintainer "Mark Lopez <m@silvenga.com>"
LABEL org.opencontainers.image.source https://github.com/silvenga-docker/tor

RUN set -xe \
    # Upgrade.
    && apt-get update \
    && apt-get dist-upgrade -y \
    # Setup repository.
    && apt-get install -y apt-transport-https wget gnupg2 \
    && wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc \
    | gpg --dearmor > /opt/torproject.gpg \
    && gpg -q --import --import-options import-show --with-colons /opt/torproject.gpg \
    | awk -F: '$1 == "fpr" { print $10 }' \
    | grep A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 \
    && echo "deb [arch=amd64, signed-by=/opt/torproject.gpg] https://deb.torproject.org/torproject.org bullseye main" \
    > /etc/apt/sources.list.d/tor.list \
    # Install tor.
    && apt-get update \
    && apt-get install -y tor obfs4proxy \
    && groupadd tor --gid 1000 \
    && adduser tor --uid 1000 --gid 1000 --disabled-password --gecos "" \
    # Cleanup.
    && apt-get purge -y wget apt-transport-https gnupg2 \
    && apt-get autoremove -y --purge \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    # Done!
    && tor --version

CMD [ "tor" ]
