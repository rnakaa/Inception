FROM	debian:bullseye

# COPY	./make-wordpressdb.sh /

RUN	apt-get update \
	&& apt-get install -y vim mariadb-server \
	&& sed -i '/^bind-address/d' /etc/mysql/mariadb.conf.d/50-server.cnf
# RUN	bash /make-wordpressdb.sh

RUN echo $MYSQL_USER
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD	["mysqld_safe"]
