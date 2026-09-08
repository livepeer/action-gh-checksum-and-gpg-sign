FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends gnupg \
    && rm -rf /var/lib/apt/lists/*

COPY scripts/entrypoint.bash /

ENTRYPOINT [ "/entrypoint.bash" ]
