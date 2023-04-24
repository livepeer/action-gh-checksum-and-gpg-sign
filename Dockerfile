FROM debian:bullseye-slim

RUN apt update && apt install -yqq gnupg

COPY scripts/entrypoint.bash /

ENTRYPOINT [ "/entrypoint.bash" ]
