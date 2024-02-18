#!/bin/bash

mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress_db;"
mysql -u root -e "CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'user'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
