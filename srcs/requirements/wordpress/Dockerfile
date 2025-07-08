FROM debian:12.5-slim

RUN apt-get update && apt-get install -y php-fpm php-mysql curl && rm -rf /var/lib/apt/lists/*

COPY tools/setup.sh /setup.sh
RUN chmod +x /setup.sh && /setup.sh

EXPOSE 9000

CMD ["php-fpm8.2", "-F"]
