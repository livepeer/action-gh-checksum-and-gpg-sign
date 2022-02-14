FROM debian:stretch-slim

WORKDIR /app

RUN apt update && apt install -yqq gnupg

COPY entrypoint.sh ./

ENTRYPOINT [ "/app/entrypoint.sh" ]
