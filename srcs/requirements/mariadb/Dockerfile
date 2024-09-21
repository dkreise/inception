FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server

EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/.

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

COPY tools/script.sh /usr/local/bin/script.sh
RUN chmod 755 /usr/local/bin/script.sh

ENTRYPOINT [ "/usr/local/bin/script.sh" ]
