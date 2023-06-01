# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sihemayoub <sihemayoub@student.42.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/18 20:21:10 by sihemayoub        #+#    #+#              #
#    Updated: 2023/05/31 22:26:42 by sihemayoub       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17.3

ARG PHP_VERSION=81	\
	DB_NAME			\
	DB_USER			\
	DB_PASS

RUN apk update && apk upgrade && apk add --no-cache	\
	php${PHP_VERSION}			\
	php${PHP_VERSION}-fpm		\
	php${PHP_VERSION}-mysqli	\
	php${PHP_VERSION}-json		\
	php${PHP_VERSION}-curl		\
	php${PHP_VERSION}-dom		\
	php${PHP_VERSION}-exif		\
	php${PHP_VERSION}-fileinfo	\
	php${PHP_VERSION}-mbstring	\
	php${PHP_VERSION}-openssl	\
	php${PHP_VERSION}-xml		\
	php${PHP_VERSION}-zip		\
	php${PHP_VERSION}-redis		\
	wget						\
	unzip &&					\
	sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g"			\
		etc/php81/php-fpm.d/www.conf &&							\
	sed -i "s|;listen.owner = nobody|listen.owner = nobody|g"	\
		/etc/php81/php-fpm.d/www.conf &&							\
	sed -i "s|;listen.group = nobody|listen.group = nobody|g"	\
		/etc/php81/php-fpm.d/www.conf &&							\
	rm -f /var/cache/apk/*

WORKDIR /var/www

RUN wget https://wordpress.org/latest.zip &&	\
	unzip latest.zip &&							\
	cp -rf wordpress/* . &&						\
	rm -rf wordpress latest.zip

COPY ./requirements/wordpress/conf/wp-config-create.sh .

RUN sh wp-config-create.sh && rm wp-config-create.sh &&	\
	chmod -R 0777 wp-content/

CMD ["/usr/sbin/php-fpm81", "-F"]
