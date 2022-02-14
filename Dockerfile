FROM debian:stretch-slim

RUN apt update && apt install -yqq gnupg

COPY *.bash /

ENTRYPOINT [ "/entrypoint.bash" ]
