#!/bin/bash
set -e

# Démarre MariaDB en arrière-plan pour l'initialisation
mysqld_safe --skip-networking &
sleep 5

# Vérifie si la DB est déjà initialisée
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "=> Initializing database..."
    mysql_install_db --user=mysql --ldata=/var/lib/mysql

    echo "=> Running init scripts..."
    for f in /docker-entrypoint-initdb.d/*; do
        case "$f" in
            *.sh)  echo "Running $f"; . "$f" ;;
            *.sql) echo "Running $f"; mysql -u root < "$f" ;;
            *)     echo "Ignoring $f" ;;
        esac
    done

    echo "=> Initialization done."
fi

# Stop MariaDB safe mode
mysqladmin -u root shutdown

# Redémarre MariaDB en mode normal
exec mysqld_safe

