#!/bin/bash

if [ ! -e "/var/lib/mysql/.done" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql
	/usr/sbin/mysqld --skip-networking &
	
    for i in {50..0}; do
		if echo 'SELECT 1' | mysql &> /dev/null; then
			break
		fi
		sleep 1
	done

	if [ "$i" -eq 0 ]; then
		echo >&2 'MariaDB'
		exit 1
	fi

	mysql -u root -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"

	mysql -u root -e "CREATE USER '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"

	mysql -u root -e "GRANT ALL ON $SQL_DATABASE.* TO '$SQL_USER'@'%';"

	mysql -u root -e "FLUSH PRIVILEGES;"

	mysql -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$SQL_ROOT_PASSWORD');"


	mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown


	touch /var/lib/mysql/.done
fi

exec "$@"





