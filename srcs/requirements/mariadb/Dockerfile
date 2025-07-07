FROM alpine:3.20

RUN apk update && \
    apk add --no-cache mariadb mariadb-client bash && \
    mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Copie du script d'initialisation
COPY tools/init-db.sh /docker-entrypoint-initdb.d/init-db.sh
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh

EXPOSE 3306
CMD ["mysqld"]
