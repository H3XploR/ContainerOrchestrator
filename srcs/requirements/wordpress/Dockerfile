FROM debian:bullseye
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wget -y
RUN apt-get install php7.3 -y
RUN apt-get install php-fpm -y
RUN apt-get install php-mysql -y
RUN apt-get install mariadb-client -y
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www 
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./conf/auto_config.sh /auto_config.sh
RUN chmod +x /auto_config.sh
RUN mkdir -p /run/php
ENTRYPOINT ["sh", "/auto_config.sh"]
CMD ["/usr/sbin/php-fpm7.3", "-F"]