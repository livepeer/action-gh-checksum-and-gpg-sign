FROM debian:stretch-slim

RUN apt update && apt install -yqq gnupg

COPY scripts/entrypoint.bash /

ENTRYPOINT [ "/entrypoint.bash" ]
