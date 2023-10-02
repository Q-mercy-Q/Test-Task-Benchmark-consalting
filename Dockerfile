
FROM alpine:3.14

RUN apk --update --no-cache add php7 php7-fpm php7-json php7-mbstring php7-session nginx supervisor

COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY nginx.conf /etc/nginx/nginx.conf

COPY supervisord.conf /etc/supervisord.conf

WORKDIR /var/www/html

COPY html/ .

EXPOSE 80

CMD ["supervisord", "-c", "/etc/supervisord.conf"]
