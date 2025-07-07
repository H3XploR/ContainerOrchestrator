#!/bin/sh
set -eu

echo "Initialisation de la base de données…"

# Création de la base et de l'utilisateur
cat <<-EOSQL > /tmp/init.sql
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '\${MYSQL_USER}'@'%' IDENTIFIED BY '\$(cat /run/secrets/db_password)';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '\${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOSQL

mysql -u root -p"$(cat /run/secrets/db_root_password)" < /tmp/init.sql
rm /tmp/init.sql
