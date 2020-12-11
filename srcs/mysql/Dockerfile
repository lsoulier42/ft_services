FROM alpine:latest

WORKDIR /home

RUN apk update && apk add mariadb mariadb-client mariadb-server-utils

COPY ./create_db.sql /home/

RUN mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql \
	&& mysql_install_db --user=mysql --ldata=/var/lib/mysql \
	&& mysqld --user=mysql --bootstrap --verbose=0 < /home/create_db.sql

COPY ./run_mysql.sh /home/

COPY ./my.cnf /etc/

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

CMD ["sh", "run_mysql.sh"]
