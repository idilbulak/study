# FROM	alpine:3.15
# ARG		DB_NAME \
#     	DB_USER \
#     	DB_PASSWORD
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

# syntax=docker/dockerfile:1

# Get the container Image
FROM alpine:3.15

# Update the index of available packages
# Upgrade the currently installed packages
# Install tools required for Mariadb
RUN apk update && apk upgrade && apk add --no-cache\
	mariadb\
	mariadb-client\
	mariadb-common\
	openrc

# Launch openrc for rc-service
RUN openrc\
	&& touch /run/openrc/softlevel

# Copy initialization script
COPY /requirements/mariadb/conf/mariadb-server.cnf	/etc/my.cnf.d/
COPY /requirements/mariadb/conf/my.cnf				/etc/
COPY /requirements/mariadb/tools/create_database.sh	/

# Expose the mariadb port
EXPOSE 3306

# Launch the script
CMD ["sh", "/create_database.sh"]