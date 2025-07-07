#!/bin/sh
mkdir -p /etc/ssl/private
openssl req -x509 -nodes -days 365 \
  -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=Login/CN=yantoine.42.fr" \
  -newkey rsa:2048 \
  -keyout /etc/ssl/private/yantoine.42.fr.key \
  -out /etc/ssl/private/yantoine.42.fr.crt
