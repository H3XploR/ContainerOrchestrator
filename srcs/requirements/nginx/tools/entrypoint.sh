#!/bin/sh
set -eu

# Copie des secrets TLS vers leurs emplacements
cp /run/secrets/tls_crt /etc/ssl/certs/server.crt
cp /run/secrets/tls_key /etc/ssl/private/server.key
chmod 600 /etc/ssl/private/server.key

# Remplacement du nom de domaine dans la conf
sed -i "s/__DOMAIN_NAME__/${DOMAIN_NAME}/g" /etc/nginx/http.d/default.conf

exec nginx -g 'daemon off;'
