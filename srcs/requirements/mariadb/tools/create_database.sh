# #!/bin/sh

# mysql_install_db --user=mysql --datadir=/var/lib/mysql

# mysqld --user=mysql --skip-networking &

# mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
# mysql -u root -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
# mysql -u root -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
# mysql -u root -e "ALTER USER \`${DB_ROOT}\@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
# mysql -u root -e "FLUSH PRIVILEGES;"

# mysqladmin -u root shutdown

# exec "$@"

cat .setup 2> /dev/null

if [ $? -ne 0 ]; then
  
  #Launches in safe mode + "&" is used to execute the command in background.
  usr/bin/mysqld_safe --datadir=/var/lib/mysql &
  
  #Waits for the server to respond to requests.
  #If "mysqladmin ping" is null, meaning that the server stopped responding, the loop stops.
  while ! mysqladmin ping -h "$MARIADB_HOST" --silent
	do
    	sleep 1
	done

  #Creates the database
    eval "echo \"$(cat /tmp/create_db.sql)\"" | mariadb
    touch .setup
fi

#Starts mysql in safe mode 
usr/bin/mysqld_safe --datadir=/var/lib/mysql
