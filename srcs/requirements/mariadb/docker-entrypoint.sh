#!/bin/bash
# apt-get install -y mariadb-server

# # mkdir -p /run/mysqld
# # chown -R mysql:mysql /run/mysqld
# # "$@" &
# # MARIADB_PID=$!
# # sleep 5
# service mariadb stop

# exec "$@"
mkdir -p /run/mysqld
adduser mysql
chown -R mysql:mysql /run/mysqld
apt-get install -y -qq mariadb-client mariadb-server
"$@" &
MARIADB_PID=$!
sleep 5

sed -i '/^bind-address/d' /etc/mysql/mariadb.conf.d/50-server.cnf
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
kill "$MARIADB_PID"
wait "$MARIADB_PID"

exec "$@"