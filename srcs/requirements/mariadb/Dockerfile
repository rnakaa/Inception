FROM debian:bullseye

RUN	apt-get update

RUN	apt-get install -y vim mariadb-server

RUN	touch /make_wordpressdb.sh

COPY	./make_wordpresdb.sh /make_wordpressdb.sh

RUN	chmod +x /make_wordpressdb.sh

RUN	sed -i '/^bind-address/d' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN	service mariadb start && /make_wordpressdb.sh

CMD	["mysqld_safe"]
