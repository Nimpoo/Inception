# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sihemayoub <sihemayoub@student.42.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/01 00:14:07 by sihemayoub        #+#    #+#              #
#    Updated: 2023/06/01 00:22:07 by sihemayoub       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	inception

all		:
		@printf "Launch configuration ${NAME}...\n"
      @bash srcs/requirements/wordpress/tools/make_dir.sh
		@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build	:
		@printf "Building configuration ${NAME}...\n"
      @bash srcs/requirements/wordpress/tools/make_dir.sh
		@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down	:
		@printf "Stopping configuration ${NAME}...\n"
		@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re		:	down
		@printf "Rebuild configuration ${NAME}...\n"
		@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean	:	down
		@printf "Cleaning configuration ${NAME}...\n"
		@docker system prune -a
		@sudo rm -rf ~/data/wordpress/*
		@sudo rm -rf ~/data/mariadb/*

fclean	:
		@printf "Total clean of all configurations docker\n"
		@docker stop $$(docker ps -qa)
		@docker system prune --all --force --volumes
		@docker network prune --force
		@docker volume prune --force
		@sudo rm -rf ~/data/wordpress/*
		@sudo rm -rf ~/data/mariadb/*

.PHONY	:	all build down re clean fclean
