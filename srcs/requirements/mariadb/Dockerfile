FROM debian:12.6

RUN apt-get update \
	&& apt-get install -y \
	mariadb-server

EXPOSE 3306

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY init.sql /etc/mysql/init.sql

RUN mkdir /run/mysqld

CMD ["mysqld"]
