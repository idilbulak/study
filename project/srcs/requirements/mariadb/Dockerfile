FROM	alpine:3.15
RUN 	apk update && apk add --no-cache mariadb mariadb-client
RUN		mkdir -p /var/run/mysqld && chmod 777 /var/run/mysqld
COPY	/requirements/mariadb/conf/mariadb-server.cnf /etc/my.cnf.d/
EXPOSE	3306
COPY	/requirements/mariadb/tools/create_database.sh .
RUN		chmod +x /create_database.sh && /create_database.sh && rm /create_database.sh
USER    mysql
CMD		["mysqld", "--skip-log-error"]
