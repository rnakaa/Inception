#!/bin/bash
service mariadb start

# パスワードを指定してMySQLコマンドを実行
mysql -u root -ppassword -e "CREATE DATABASE IF NOT EXISTS wordpress_db;"
mysql -u root -ppassword -e "CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';"
mysql -u root -ppassword -e "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'user'@'%';"
mysql -u root -ppassword -e "FLUSH PRIVILEGES;"

