FROM	alpine:3.15
RUN		apk update && \
		apk add --no-cache php8 php8-fpm php8-mysqli mariadb-client wget
WORKDIR	/var/www
RUN		wget https://wordpress.org/latest.tar.gz && \
    	tar -zxvf latest.tar.gz && rm latest.tar.gz
RUN		chown -R root:root /wordpress
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp
COPY	/requirements/wordpress/conf/www.conf	/etc/php/8/fpm/pool.d/www.conf
COPY	/requirements/wordpress/tools/conf-setup.sh .
RUN		chmod +x /conf-setup.sh && /conf-setup.sh && rm -f /conf-setup.sh
EXPOSE	9000
CMD		["php-fpm8", "-F"]

# php8: the main PHP package
# php8-fpm: the PHP FastCGI Process Manager, which is used to handle PHP requests
# php8-mysqli: the MySQLi extension for PHP, which is required for WordPress to interact with MySQL databases
# php8-pdo_mysql: the PDO MySQL extension for PHP, which is also required for WordPress to interact with MySQL databases
# php8-gd: the GD extension for PHP, which is used for image manipulation in WordPress
# php8-xml: the XML extension for PHP, which is used for parsing XML data in WordPress
# php8-curl: the cURL extension for PHP, which is used for making HTTP requests in WordPress
# php8-opcache: the OPcache extension for PHP, which is used to cache PHP bytecode for faster performance
# php8-zip: the ZIP extension for PHP, which is used for working with ZIP archives in WordPress
