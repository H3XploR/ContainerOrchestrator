#!/bin/sh
curl -LO https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz --strip-components=1 -C /var/www/html
rm latest.tar.gz
chown -R www-data:www-data /var/www/html
