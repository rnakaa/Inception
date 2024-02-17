FROM	debian:bullseye

RUN	apt-get update \
	&& apt-get install -y vim wget unzip \
	&& apt-get install -y php7.4-fpm php7.4-mysqli php7.4-gd php7.4-curl php7.4-xml php7.4-mbstring php7.4-zip \
	&& wget https://wordpress.org/latest.zip \
	&& unzip latest.zip \
	&& mkdir -p /var/www/html \
	&& cp -r /wordpress/* /var/www/html/
