FROM alpine:latest

WORKDIR /home

RUN apk update && apk add mariadb mariadb-client mariadb-server-utils

RUN mkdir -p /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld

COPY ./run_mysql.sh /home/

COPY ./create_db.sql /home/

COPY ./my.cnf /etc/

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

CMD ["sh", "run_mysql.sh"]
