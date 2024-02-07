# tor

Yet another Tor image.

This image is published weekly by Github Actions, this ensures tor and other package upgrades are integrated in a timely manner.

```bash
docker pull ghcr.io/silvenga-docker/tor:latest

docker run -it --rm \
    ghcr.io/silvenga-docker/tor:latest \
    -v /opt/tor/data:/home/tor
    tor --DataDirectory /home/tor --User tor
```

All options can be specified using the command line. Make sure to specify a stable `--DataDirectory` for tor to store it's keys in (so that your node maintains a stable identity). This directory should be mounted onto persistent storage.

When running tor inside a docker container, it may be useful to specify options such as `--Address`, `--ContactInfo`, and `--Nickname`. Operators should consult the [manual pages](https://manpages.debian.org/experimental/tor/tor.1.en.html) for any desireable settings.
