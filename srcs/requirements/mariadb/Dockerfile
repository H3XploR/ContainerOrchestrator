FROM debian:12.5-slim

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/my.cnf
COPY init.sql /docker-entrypoint-initdb.d/
EXPOSE 3306

CMD ["mysqld_safe"]
