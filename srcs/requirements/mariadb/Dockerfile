FROM debian:12.5-slim

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3306

COPY conf/my.cnf /etc/mysql/my.cnf
COPY init.sh /docker-entrypoint-initdb.d/init.sh
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh /docker-entrypoint-initdb.d/init.sh

ENTRYPOINT ["/entrypoint.sh"]

