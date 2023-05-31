# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sihemayoub <sihemayoub@student.42.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/18 20:21:10 by sihemayoub        #+#    #+#              #
#    Updated: 2023/05/22 14:15:50 by sihemayoub       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17.3

ARG PHP_VERSION=8	\
	DB_NAME			\
	DB_USER			\
	DB_PASS

RUN apk update && apk upgrade && apk add --no-cache	\
	php${PHP_VERSION}		\
	php${PHP_VERSION}-fpm	\
	php${PHP_VERSION}-mysqli
	

