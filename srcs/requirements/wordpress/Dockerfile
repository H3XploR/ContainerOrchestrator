FROM alpine:3.20

RUN apk update && \
    apk add --no-cache php82 php82-fpm php82-mysqli php82-json php82-session php82-phar \
        php82-xml php82-mbstring php82-gd php82-curl php82-dom wget bash && \
    adduser -D -g 'www' www

WORKDIR /var/www/html

# Téléchargement de WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz

COPY tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh && \
    chown -R www:www /var/www/html && \
    sed -i 's|listen = .*|listen = 0.0.0.0:9000|' /etc/php82/php-fpm.d/www.conf

USER www
EXPOSE 9000
ENTRYPOINT ["/entrypoint.sh"]
