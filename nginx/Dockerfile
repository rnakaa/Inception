FROM debian:latest

RUN apt-get update \
    && apt-get install -y vim systemctl nginx \
    && systemctl start nginx
