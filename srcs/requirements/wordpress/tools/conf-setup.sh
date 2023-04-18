#!bin/bash
sleep 10
if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp config create --allow-root \
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_PASSWORD \
    	--dbhost=mariadb:3306 \
		--path='/var/www/wordpress'

	sleep 10
	wp core install --url=$DOMAINE_NAME \
		--title=$SITE_NAME \
		--admin_user=$ADMIN_NAME \
		--admin_password=$ADMIN_PASSWORD \
		--allow-root \
		--path='/var/www/wordpress'
	wp user create --allow-root \
		--role=author $USER_NAME \
		--user_pass=$USER_PASSWORD \
		--path='/var/www/wordpress' >> /log.txt
fi

if [ ! -d /run/php ]; then
    mkdir ./run/php
fi