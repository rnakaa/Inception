#!/bin/bash

start_mariadb() {
	"$@" &
	MARIADB_PID=$!
	sleep 5
}

stop_mariadb() {
	kill "$MARIADB_PID"
	wait "$MARIADB_PID"
}

mkdir -p /run/mysqld
adduser mysql
chown -R mysql:mysql /run/mysqld
apt-get install -y -qq mariadb-client mariadb-server

"$@" &
MARIADB_PID=$!
sleep 5
mysql -uroot -ppassword -e "select 1"
if ! mysql -uroot -e ";" ; then
	start_mariadb
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
	stop_mariadb
fi

start_mariadb
if ! mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "USE $MYSQL_DATABASES;" ; then
	mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
	mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
	mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
	sed -i '/^bind-address/d' /etc/mysql/mariadb.conf.d/50-server.cnf
	stop_mariadb
fi

exec "$@"