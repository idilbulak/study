# FROM	alpine:3.15
# ARG		DB_NAME \
#     	DB_USER \
#     	DB_PASSWORD
# RUN 	apk update && \
# 		apk add --no-cache mariadb mariadb-client
# RUN		mkdir /var/run/mysqld; \
#     	chmod 777 /var/run/mysqld;
# RUN mkdir /var/run/mysqld; \
#     chmod 777 /var/run/mysqld; \
#     { echo '[mysqld]'; \
#       echo 'skip-host-cache'; \
#       echo 'skip-name-resolve'; \
#       echo 'bind-address=0.0.0.0'; \
#     } | tee  /etc/my.cnf.d/docker.cnf; \
#     sed -i "s|skip-networking|skip-networking=0|g" \
#       /etc/my.cnf.d/mariadb-server.cnf
# RUN		mysql_install_db --user=mysql --datadir=/var/lib/mysql
# # COPY	/requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf


# EXPOSE	3306

# COPY	/requirements/mariadb/tools/create_database.sh .
# RUN		chmod +x /create_database.sh && /create_database.sh

# USER mysql
# CMD ["mysqld", "--skip-log-error"]

FROM		alpine:3.15

RUN		apk update \
		&& apk upgrade \
		&& apk add --no-cache mariadb mariadb-client

# we give to the mysql user the rights on mariadb
# then `mariadb-install-db` initialize the MariaDB data directory and creates the system tables in the mysql database
RUN		mkdir -p /run/mysqld /var/lib/mysql \
		&& chown -R mysql:mysql /run/mysqld /var/lib/mysql \
		&& mariadb-install-db --skip-test-db --user=mysql --datadir=/var/lib/mysql

# in the mariadb configuration file, we disable the skip-networking directive on mysqld
# this will allows us to commmunicate with the mariadb daemon via another container
RUN		sed -i 's/skip-networking/#&/' /etc/my.cnf.d/mariadb-server.cnf

COPY		/requirements/mariadb/tools/create_database.sh /usr/local/bin/

ENTRYPOINT	["create_database.sh"]

CMD		["mysqld_safe"]