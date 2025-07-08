#!/bin/sh

# Initialisation de la base de données si elle n'existe pas
if [ ! -d "/var/lib/mysql/mysql" ]; then
  echo "Initialisation de la base de données..."

  mysqld --user=mysql --bootstrap << EOF
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

else
  echo "Base de données déjà initialisée."
fi

exec mysqld_safe --user=mysql

