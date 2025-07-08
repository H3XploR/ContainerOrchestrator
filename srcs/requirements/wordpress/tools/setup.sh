#!/bin/sh

# Télécharger WordPress
curl -LO https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz --strip-components=1 -C /var/www/html
rm latest.tar.gz
chown -R www-data:www-data /var/www/html

echo "🔍 MYSQL_HOST=$MYSQL_HOST"
echo "🔍 MYSQL_USER=$MYSQL_USER"
echo "🔍 MYSQL_PASSWORD=$MYSQL_PASSWORD"

# Attendre que MariaDB soit prêt
echo "Waiting for MariaDB to be ready..."
until echo "$MYSQL_PASSWORD" | mysqladmin --silent ping -h"$MYSQL_HOST" -u"$MYSQL_USER" -p; do
    sleep 1
done

# Générer wp-config.php
wp config create --path=/var/www/html \
    --dbname=$MYSQL_DATABASE \
    --dbuser=$MYSQL_USER \
    --dbpass=$MYSQL_PASSWORD \
    --dbhost=$MYSQL_HOST \
    --skip-check \
    --allow-root

# Installation auto
wp core install --path=/var/www/html \
    --url="https://$DOMAIN_NAME" \
    --title="Mon site WordPress" \
    --admin_user="$ADMIN_USER" \
    --admin_password="$ADMIN_PASSWORD" \
    --admin_email="$ADMIN_MAIL" \
    --skip-email \
    --allow-root

# Créer un utilisateur WordPress normal
wp user create "$NORMAL_USER" "$NORMAL_MAIL" \
    --user_pass="$NORMAL_PASSWORD" \
    --role=subscriber \
    --path=/var/www/html \
    --allow-root


chown -R www-data:www-data /var/www/html

exec php-fpm8.2 -F
