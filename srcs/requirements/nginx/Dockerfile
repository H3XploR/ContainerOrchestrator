FROM debian:12.5-slim

RUN apt-get update && apt-get install -y nginx openssl && rm -rf /var/lib/apt/lists/*

RUN mkdir /etc/ssl/certs /etc/ssl/private
COPY tools/mkcert.sh /tmp/mkcert.sh
RUN chmod +x /tmp/mkcert.sh && /tmp/mkcert.sh

COPY conf/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
