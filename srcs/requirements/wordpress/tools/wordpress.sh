#!/bin/bash

if [ ! -f ./wp-config.php ]; then

	wp core download --allow-root


	wp config create --dbname=$SQL_DATABSE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb --allow-root

	wp core install --url=$DOMAIN_NAME --title="$WP_TITLE" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root

	wp user create $WP_NORMAL_USER $WP_NORMAL_USER_EMAIL --user_pass=$WP_NORMAL_USER_PASSWORD --role=author --allow-root
fi

exec "$@"