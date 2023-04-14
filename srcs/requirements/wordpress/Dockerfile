FROM	alpine:3.15
ARG 	DB_NAME \
   		DB_USER \
    	DB_PASSWORD
WORKDIR	/var/www
RUN		apk update && \
		apk upgrade && \
		apk add --no-cache php8.2 php8.2-fpm php8.2-mysqli php8.2-pdo_mysql php8.2-gd php8.2-xml php8.2-curl php8.2-opcache php8.2-zip curl
COPY	tools/conf-setup.sh .
RUN		chmod +x /conf-setup.sh && /conf-setup.sh && rm /conf-setup.sh
RUN		curl -O https://wordpress.org/latest.tar.gz && \
    	tar -zxvf latest.tar.gz && cp -rf wordpress . && rm latest.tar.gz
COPY	conf/wp-config.php /var/www/wordpress/
RUN		chmod -R 0777 /var/www/wordpress/wp-content/
EXPOSE	9000
CMD		["php-fpm8.2", "-F"]

# php8.2: the main PHP package
# php8.2-fpm: the PHP FastCGI Process Manager, which is used to handle PHP requests
# php8.2-mysqli: the MySQLi extension for PHP, which is required for WordPress to interact with MySQL databases
# php8.2-pdo_mysql: the PDO MySQL extension for PHP, which is also required for WordPress to interact with MySQL databases
# php8.2-gd: the GD extension for PHP, which is used for image manipulation in WordPress
# php8.2-xml: the XML extension for PHP, which is used for parsing XML data in WordPress
# php8.2-curl: the cURL extension for PHP, which is used for making HTTP requests in WordPress
# php8.2-opcache: the OPcache extension for PHP, which is used to cache PHP bytecode for faster performance
# php8.2-zip: the ZIP extension for PHP, which is used for working with ZIP archives in WordPress
