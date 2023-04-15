FROM	alpine:3.15
ARG		DB_NAME \
    	DB_USER \
    	DB_PASS
RUN 	apk update && \
		apk add --no-cache mariadb mariadb-client
RUN		mkdir /var/run/mysqld; \
    	chmod 777 /var/run/mysqld;

RUN		mysql_install_db --user=mysql --datadir=/var/lib/mysql
COPY	/requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf


EXPOSE	3306

COPY	/requirements/mariadb/tools/create_database.sh .
RUN		chmod +x /create_database.sh && /create_database.sh

USER mysql
CMD ["mysqld", "--skip-log-error"]