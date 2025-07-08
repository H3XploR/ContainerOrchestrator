#!/bin/sh
openssl req -x509 -nodes -days 365     -newkey rsa:2048     -keyout /etc/ssl/private/tls.key     -out /etc/ssl/certs/server.pem     -subj "/C=FR/ST=France/L=Paris/O=42/CN=yantoine.42.fr"
