# Use an official Alpine Linux runtime as a parent image
FROM	alpine:3.15

# Set the working directory to /var/www/html
WORKDIR	/var/www/html

# Install PHP and required extensions for WordPress
RUN		apk update && \
		apk upgrade && \
		apk add --no-cache php7 php7-fpm php7-mysqli php7-pdo_mysql php7-gd php7-xml php7-curl php7-opcache php7-zip curl

# Download and extract WordPress
RUN		curl -O https://wordpress.org/latest.tar.gz && \
    	tar -zxvf latest.tar.gz && \
    	rm latest.tar.gz

# Set the ownership and permissions of the WordPress files
RUN		chown -R 0777 /var/www/html/wordpress && \
    	chmod -R 0777 /var/www/html/wordpress

# Set the PHP timezone
RUN echo "date.timezone = UTC" > /etc/php7/conf.d/timezone.ini

EXPOSE 443

# Set the entrypoint to start php-fpm
CMD ["php-fpm7", "-F"]

# php7: the main PHP package
# php7-fpm: the PHP FastCGI Process Manager, which is used to handle PHP requests
# php7-mysqli: the MySQLi extension for PHP, which is required for WordPress to interact with MySQL databases
# php7-pdo_mysql: the PDO MySQL extension for PHP, which is also required for WordPress to interact with MySQL databases
# php7-gd: the GD extension for PHP, which is used for image manipulation in WordPress
# php7-xml: the XML extension for PHP, which is used for parsing XML data in WordPress
# php7-curl: the cURL extension for PHP, which is used for making HTTP requests in WordPress
# php7-opcache: the OPcache extension for PHP, which is used to cache PHP bytecode for faster performance
# php7-zip: the ZIP extension for PHP, which is used for working with ZIP archives in WordPress
