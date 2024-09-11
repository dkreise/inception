FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server

EXPOSE 3306

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
#COPY init.sql /etc/mysql/init.sql
#COPY script.sh .

#RUN mkdir /run/mysqld && chmod +x script.sh

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

#RUN chmod +x script.sh
COPY script.sh /usr/local/bin/script.sh
RUN chmod 755 /usr/local/bin/script.sh

#RUN mysql_install_db

#CMD ["./script.sh"]
ENTRYPOINT [ "/usr/local/bin/script.sh" ]
