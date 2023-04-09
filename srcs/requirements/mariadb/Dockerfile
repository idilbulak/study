FROM alpine:3.17

ARG MYSQL_NAME \
    MYSQL_USER \
    MYSQL_PASSSWORD

RUN apk update && \
	apk add --no-cache mariadb mariadb-client && \
	mkdir -p /var/lib/mysql && \
	mkdir -p /var/lib/wordpress && \
	chown -R mysql:mysql /var/lib/mysql

COPY tools/setup_mysql.sh /setup_mysql.sh
RUN chmod +x /setup_mysql.sh && \
	/setup_mysql.sh

EXPOSE 3306

COPY tools/create_database.sh .
RUN chmod +x /create_database.sh && \
	/create_database.sh

USER mysql

CMD ["/usr/bin/mysqld", "--skip-log-error"]