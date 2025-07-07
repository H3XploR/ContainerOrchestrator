#!/bin/bash

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

#line 23
sed -i -r "s/database_name_here/$DB_NAME/1"   wp-config.php
#line 26
sed -i -r "s/username_here/$DB_USER/1"  wp-config.php
#line 29
sed -i -r "s/password_here/$DB_PWD/1"    wp-config.php

#line 32
sed -i -r "s/localhost/mariadb/1"    wp-config.php  #connect mariadb database

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root