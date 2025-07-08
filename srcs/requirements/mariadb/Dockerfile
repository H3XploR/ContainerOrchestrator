FROM debian:12.5-slim

RUN apt-get update && apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/my.cnf
COPY ./conf/50-server.cnf /etc/my.cnf
COPY ./tools/init.sh /init.sh
RUN chmod +x /init.sh

EXPOSE 3306

CMD ["/init.sh"]

