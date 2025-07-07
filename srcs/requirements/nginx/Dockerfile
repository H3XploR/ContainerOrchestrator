FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl && \
    mkdir -p /etc/nginx/ssl /var/run/nginx && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/server_pkey.pem \
    -out /etc/nginx/ssl/server.crt \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=yantoine.42.fr/UID=yantoine"

COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf

# Suppression du site par défaut et activation de la nouvelle configuration
RUN rm /etc/nginx/sites-enabled/default && \
    ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

EXPOSE 443

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

