#!/bin/sh

mysql_install_db --user=mysql --datadir=/var/lib/mysql

mysqld --user=mysql --skip-networking &

mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mysql -u root -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u root -e "ALTER USER \`${DB_ROOT}\@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u root -e "FLUSH PRIVILEGES;"

mysqladmin -u root shutdown

exec "$@"

