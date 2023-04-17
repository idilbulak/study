FROM	alpine:3.15
ARG		DB_NAME \
    	DB_USER \
    	DB_PASSWORD
# RUN 	apk update && \
# 		apk add --no-cache mariadb mariadb-client
# RUN		mkdir /var/run/mysqld; \
#     	chmod 777 /var/run/mysqld;

# RUN		mysql_install_db --user=mysql --datadir=/var/lib/mysql
# COPY	/requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf


# EXPOSE	3306

# COPY	/requirements/mariadb/tools/create_database.sh .
# RUN		chmod +x /create_database.sh && /create_database.sh

# USER mysql
# CMD ["mysqld", "--skip-log-error"]

RUN apk update --no-cache && \
	apk add mariadb mariadb-client

RUN sed -i "7i user=mysql\ndatadir=/var/lib/mysql/" /etc/my.cnf.d/mariadb-server.cnf && \
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal && \
	mkdir /run/mysqld && \
	chown mysql:mysql /run/mysqld

RUN echo "[mysqld]" > /etc/my.cnf.d/mariadb-server.cnf && \
	echo "user = mysql" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "datadir = /var/lib/mysql/" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "port = 3306" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "bind-address = 0.0.0.0" >> /etc/my.cnf.d/mariadb-server.cnf && \
	echo "skip-networking = false" >> /etc/my.cnf.d/mariadb-server.cnf

RUN mysqld &\
	sleep 3 && \
	echo "CREATE DATABASE $DB_NAME" | mysql && \
	echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql && \
	echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" | mysql && \
	echo "FLUSH PRIVILEGES;" | mysql && \
	echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_PASSWORD');" | mysql

EXPOSE 3306

CMD ["mysqld"]