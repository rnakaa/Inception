#!/bin/sh
wp core download --path=/var/www/html/ --allow-root 
if ! wp core is-installed --allow-root ; then
	cd /var/www/html
	wp config create --dbname="$WORDPRESS_DB_NAME" --dbuser="$WORDPRESS_DB_USER" --dbpass="$WORDPRESS_DB_PASSWORD" --dbhost="$WORDPRESS_DB_HOST" --allow-root
	wp core install --url=rnaka.42.fr --title="My-page" --admin_user=user --admin_password=password --admin_email=nakdf@gmail.com --allow-root
	wp user create --url=rnaka.42.fr ann ann@example.com --role=author --allow-root
fi

exec "$@"
