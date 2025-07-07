#!/bin/sh
set -eu

CONFIG=/var/www/html/wp-config.php

if [ ! -f "$CONFIG" ]; then
    cp wp-config-sample.php $CONFIG
    sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/" $CONFIG
    sed -i "s/username_here/${WORDPRESS_DB_USER}/" $CONFIG
    sed -i "s/password_here/$(cat ${WORDPRESS_DB_PASSWORD_FILE})/" $CONFIG
    sed -i "s/localhost/${WORDPRESS_DB_HOST}/" $CONFIG
fi

# Lancement de php-fpm au premier plan
php-fpm --nodaemonize
