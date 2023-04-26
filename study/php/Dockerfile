# FROM php:7.4-fpm-alpine

# RUN apk update --update-cache --no-cache

# RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

FROM alpine:3.17

RUN apk update && apk add --no-cache php7.4 php7.4-fpm php7.4-mysqli && rm -rf /var/cache/apk/*

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]

