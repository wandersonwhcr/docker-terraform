FROM debian:10

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install --yes --no-install-recommends \
        ca-certificates \
        dirmngr \
        gnupg \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-key DA418C88A3219F7B \
    && echo "deb https://apt.releases.hashicorp.com buster main" > /etc/apt/sources.list.d/terraform.list \
    && apt-get update \
    && apt-get install --yes terraform \
    && rm -rf /etc/apt/sources.list.d/terraform.list \
    && apt-key del DA418C88A3219F7B \
    && apt-get autoremove --yes --purge \
        dirmngr \
        gnupg \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists

VOLUME /app

WORKDIR /app
