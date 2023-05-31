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

RUN mysql_instqll_db --user=mysql --dqtqdir=/var/lib/mysql

EXPOSE 3306

USER mysql
COPY tools/db.sh ./
ENTRYPOINT ["sh", "creat_db.sh"]
CMD ["/usr/bin/mysqld", "--skip-log-error"]

