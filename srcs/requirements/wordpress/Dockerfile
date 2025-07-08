FROM debian:12.5-slim

RUN apt-get update && apt-get install -y php-fpm php-mysql curl && rm -rf /var/lib/apt/lists/*

# Force PHP-FPM à écouter sur le port TCP 9000
RUN sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/8.2/fpm/pool.d/www.conf

# Créer le dossier AVANT de lancer le script
RUN mkdir -p /var/www/html

COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh && /setup.sh

EXPOSE 9000

CMD ["php-fpm8.2", "-F"]

