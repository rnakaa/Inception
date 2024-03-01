#!/bin/bash
apt-get install -y mariadb-server

sed -i '/^bind-address/d' /etc/mysql/mariadb.conf.d/50-server.cnf
# mkdir -p /run/mysqld
# chown -R mysql:mysql /run/mysqld
# "$@" &
# MARIADB_PID=$!
# sleep 5
service mariadb start
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';"
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
service mariadb stop
# kill "$MARIADB_PID"
# wait "$MARIADB_PID"


exec "$@"