FROM	alpine:3.15
RUN 	apk update && apk add mariadb mariadb-client
RUN		mkdir -p /var/run/mysqld && chmod 777 /var/run/mysqld
COPY	/requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	/requirements/mariadb/tools/create_database.sh .
RUN		chmod +x /create_database.sh && chown -R mysql:mysql /var/run/mysqld && /create_database.sh && rm /create_database.sh
EXPOSE	3306
USER    mysql
CMD		["mysqld"]