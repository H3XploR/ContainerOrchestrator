FROM alpine:3.19

RUN apk add --no-cache nginx openssl

COPY conf/default.conf /etc/nginx/http.d/default.conf
COPY tools/generate_ssl.sh /tmp/generate_ssl.sh

RUN chmod +x /tmp/generate_ssl.sh && /tmp/generate_ssl.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
