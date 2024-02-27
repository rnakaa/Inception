#!/bin/bash
apt-get install -y mariadb-server openrc


# mariadbd &
# PID=$!
# sleep 3
declare -g MARIADB_PID
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
# kill $PID
# wait $PID
sed -i '/^bind-address/d' /etc/mysql/mariadb.conf.d/50-server.cnf

exec "$@"