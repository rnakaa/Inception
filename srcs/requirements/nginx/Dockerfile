FROM debian:bullseye

RUN	apt-get update \
	&& apt-get install -y vim nginx openssl curl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/"

CMD	["nginx", "-g", "daemon off;"]
