#!/bin/sh

sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php7/php-fpm.d/www.conf
sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php7/php-fpm.d/www.conf
sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php7/php-fpm.d/www.conf
