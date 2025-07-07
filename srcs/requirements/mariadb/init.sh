#!/bin/bash
set -e

# Lancement du serveur en background
mysqld_safe &

# Attente que MariaDB soit accessible
echo "Waiting for MariaDB to start..."
until mysqladmin ping --silent; do
    sleep 1
done

echo "MariaDB started."

# Création base + utilisateur
mysql -u root <<-EOSQL
    CREATE DATABASE IF NOT EXISTS wordpress_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    CREATE USER IF NOT EXISTS 'wp_user'@'%' IDENTIFIED BY 'wp_pass123';
    GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wp_user'@'%';
    FLUSH PRIVILEGES;
EOSQL

# Tu peux ajouter ici d'autres commandes SQL si besoin

# Arrêter proprement MariaDB lancé en background
mysqladmin -u root shutdown

