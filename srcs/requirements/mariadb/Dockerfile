FROM debian:12.5-slim

RUN apt-get update && apt-get install -y mariadb-server && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /var/lib/mysql /run/mysqld

COPY tools/init.sh /init.sh
RUN chmod +x /init.sh

ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=yantoine
ENV MYSQL_PASSWORD=password

EXPOSE 3306

CMD ["/init.sh"]

