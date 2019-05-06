FROM timescale/timescaledb:1.2.2-pg11-bitnami

USER 0
RUN set -ex \
    && mkdir -p /var/lib/apt/lists/partial \
    && apt-get update \
    && apt-get -y install \
            \
            build-essential \
            libssl-dev \
            git \
            \
            dpkg-dev \
            gcc \
            libc-dev \
            make \
            cmake \
            wget \
    && mkdir -p /build/ \
    && git clone https://github.com/timescale/pg_prometheus /build/pg_prometheus \
    && cd /build/pg_prometheus && git checkout 06b4c838a65ec096a236ba38f0046d03111dc1c7 \
    \
    && make -C /build/pg_prometheus install \
    && chmod g+w /opt/bitnami/postgresql/lib/pg_prometheus.so

USER 1001
