FROM	alpine:3.15
ARG		DB_NAME \
    	DB_USER \
    	DB_PASS
RUN 	apk update && \
		apk add --no-cache mariadb mariadb-client
RUN		mkdir /var/run/mysqld; \
    	chmod 777 /var/run/mysqld;

COPY	srcs/requirements/mariadb/conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
RUN		mysql_install_db --user=mysql --datadir=/var/lib/mysql


EXPOSE	3306

COPY	tools/create_database.sh .
RUN		chmod +x /create_database.sh && /create_database.sh

USER mysql
CMD ["mysqld", "--skip-log-error"]