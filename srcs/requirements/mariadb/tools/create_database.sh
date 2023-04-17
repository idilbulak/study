#!/usr/bin/env sh

# launch mariadb server
mysqld_safe & 

# we need to wait for the server to be running before passing it the SQL script
sleep 2
until mysqladmin ping 2> /dev/null; do
	sleep 1
done

# now let's pass the SQL script
mysql -u root 2> /dev/null << EOF
# first, we set the password and disable remote connection for the root user
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# and we also delete the empty user for security reasons
DELETE FROM mysql.user WHERE User='';
# then we create the database
CREATE DATABASE IF NOT EXISTS wordpress;
# we create an admin user and we give him all privileges on the database
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
FLUSH PRIVILEGES;
EOF

# finaly, we restart mariadb
mysqladmin --user=root --password=$MYSQL_ROOT_PASSWORD shutdown 2> /dev/null
exec "$@"