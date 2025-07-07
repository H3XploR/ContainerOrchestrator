FROM debian:bullseye
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
COPY ./tools/mariadb.sh /mariadb.sh

RUN chmod +x /mariadb.sh

EXPOSE 3306
RUN ./mariadb.sh

ENTRYPOINT ["/usr/sbin/mysqld"]