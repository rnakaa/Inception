#!/bin/sh

if ! wp core is-installed --allow-root ; then
	cd /var/www/html
	wp config create --dbname="wordpress_db" --dbuser="user" --dbpass="password" --dbhost="mariadb" --path=/var/www/html --allow-root
	wp core install --url=rnaka.42.fr --title="My-page" --admin_user=user --admin_password=password --admin_email=nakdf@gmail.com --path=/var/www/html --allow-root
fi

exec "$@"
