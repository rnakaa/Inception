FROM	debian:bullseye

RUN	apt-get update

RUN	apt-get install -y vim wget unzip \
	&& apt-get install -y php7.4-fpm php7.4-mysqli php7.4-gd php7.4-curl php7.4-xml php7.4-mbstring php7.4-zip

RUN	wget https://wordpress.org/latest.zip \
	&& unzip latest.zip \
	&& mkdir -p /var/www/html \
	&& mkdir -p /run/php \
	&& touch /run/php/php7.4-fpm.pid \
	&& chmod 755 /run/php/php7.4-fpm.pid \
	&& cp -r /wordpress/* /var/www/html/

CMD ["php-fpm7.4", "-F"]
