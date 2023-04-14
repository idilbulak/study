FROM	alpine:3.15
ARG 	DB_NAME \
   		DB_USER \
    	DB_PASS
RUN		apk update && \
		apk upgrade && \
		apk add --no-cache php7 php7-fpm php7-mysqli php7-pdo_mysql php7-gd php7-xml php7-curl php7-opcache php7-zip curl
COPY	tools/conf-setup.sh .
RUN		chmod +x /conf-setup.sh && \
    	/conf-setup.sh && \
    	rm /conf-setup.sh
RUN		curl -O https://wordpress.org/latest.tar.gz && \
    	tar -zxvf latest.tar.gz && \
    	rm latest.tar.gz
WORKDIR	/var/www
RUN		chown -R 0777 /var/www/wordpress && \
    	chmod -R 0777 /var/www/wordpress
EXPOSE	9000
COPY	conf/wp-config.php /var/www/wp-config.php
CMD		["php-fpm7", "-F"]

# php7: the main PHP package
# php7-fpm: the PHP FastCGI Process Manager, which is used to handle PHP requests
# php7-mysqli: the MySQLi extension for PHP, which is required for WordPress to interact with MySQL databases
# php7-pdo_mysql: the PDO MySQL extension for PHP, which is also required for WordPress to interact with MySQL databases
# php7-gd: the GD extension for PHP, which is used for image manipulation in WordPress
# php7-xml: the XML extension for PHP, which is used for parsing XML data in WordPress
# php7-curl: the cURL extension for PHP, which is used for making HTTP requests in WordPress
# php7-opcache: the OPcache extension for PHP, which is used to cache PHP bytecode for faster performance
# php7-zip: the ZIP extension for PHP, which is used for working with ZIP archives in WordPress
