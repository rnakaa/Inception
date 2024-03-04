#!/bin/sh
wp core download --path=/var/www/html/ --allow-root 
if ! wp core is-installed --allow-root ; then
	cd /var/www/html
	wp config create --dbname="$WORDPRESS_DB_NAME" --dbuser="$WORDPRESS_DB_USER" --dbpass="$WORDPRESS_DB_PASSWORD" --dbhost="$WORDPRESS_DB_HOST" --allow-root
	wp core install --url="$WORDPRESS_URL" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL" --allow-root
	wp user create --url="$WORDPRESS_URL" "$WORDPRESS_USER_NAME" "$WORDPRESS_USER_EMAIL" --role="$WORDPRESS_USER_ROLE" --allow-root
fi

exec "$@"