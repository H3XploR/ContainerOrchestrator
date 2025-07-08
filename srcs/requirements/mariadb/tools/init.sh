#!/bin/bash

chown -R mysql: /var/lib/mysql
chmod 777 /var/lib/mysql

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
  rm -f /db1.sql
  echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > /db1.sql
  echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> /db1.sql
  echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;" >> /db1.sql
  echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost' WITH GRANT OPTION;" >> /db1.sql
  echo "FLUSH PRIVILEGES;" >> /db1.sql
  echo "DROP USER 'root'@'localhost';" >> /db1.sql
  echo "CREATE USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> /db1.sql
  echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" >> /db1.sql
  echo "FLUSH PRIVILEGES;" >> /db1.sql
  mariadbd-safe --init-file=/db1.sql  > /dev/null 2>&1
else
  mariadbd-safe >/dev/null 2>&1
fi
