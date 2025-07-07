FROM debian:11

RUN apt-get update && apt-get install -y \
    mariadb-client \
    curl \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-cli \
    php7.4-curl \
    php7.4-gd \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-zip \
    && apt-get clean

# Fix: créer le dossier /run/php
RUN mkdir -p /run/php

# Fix: forcer php-fpm à écouter sur le port 9000
RUN sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/html

RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz --strip-components=1 && \
    rm wordpress.tar.gz

COPY conf/wp-config.php /var/www/html/wp-config.php

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]

