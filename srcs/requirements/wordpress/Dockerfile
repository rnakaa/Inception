FROM	debian:bullseye

RUN	apt-get update \
	&& apt-get install -y vim wget unzip \
	&& apt-get install -y php7.4-fpm php7.4-mysqli php7.4-gd php7.4-curl php7.4-xml php7.4-mbstring php7.4-zip

RUN	wget https://wordpress.org/latest.zip \
	&& unzip latest.zip
RUN	mkdir -p /run/php \
	&& touch /run/php/php7.4-fpm.pid \
	&& chmod 755 /run/php/php7.4-fpm.pid
RUN	mkdir -p /var/www/html \
	&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp
# RUN wp core download --path=/var/www/html/ --allow-root 

COPY	./docker-entrypoint.sh /usr/local/bin/
RUN	chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["php-fpm7.4", "-F"]
