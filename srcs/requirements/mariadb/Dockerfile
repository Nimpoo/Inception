# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sihemayoub <sihemayoub@student.42.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/18 21:13:26 by sihemayoub        #+#    #+#              #
#    Updated: 2023/05/22 14:15:54 by sihemayoub       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17.3

ARG DB_NAME	\
	DB_USER	\
	DB_PASS	\
	DB_ROOT

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir /var/run/mysqld;							\
	chmod 777 /var/run/mysqld;						\
	{	echo '[mysqld]';							\
		echo 'skip-host-cache';						\
		echo 'skip-name-resolve';					\
		echo 'bind-address=0.0.0.0';				\
	}	| tee /etc/my.cnf.d/docker.cnf;				\
	sed -i "s|skip-networking|skip-networking=o|g"	\
	/etc/my.cnf.d/mariadb-server.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY requirements/mariadb/conf/create_db.sh .
RUN sh create_db.sh && rm create_db.sh
USER mysql
CMD ["/usr/bin/mysqld", "--skip-log-error"]

