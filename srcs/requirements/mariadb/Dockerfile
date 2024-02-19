FROM	debian:bullseye

COPY	./make-wordpressdb.sh /

RUN	apt-get update \
	&& apt-get install -y vim mariadb-server \
	&& sed -i '/^bind-address/d' /etc/mysql/mariadb.conf.d/50-server.cnf \
	&& bash /make-wordpressdb.sh

CMD	["mysqld_safe"]
