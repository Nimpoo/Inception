# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    make_dir.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sihemayoub <sihemayoub@student.42.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/31 23:26:19 by sihemayoub        #+#    #+#              #
#    Updated: 2023/05/31 23:27:12 by sihemayoub       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

if [ ! -d "/home/${USER}/data" ]; then
	mkdir ~/data
	mkdir ~/data/mariadb
	mkdir ~/data/wordpress
fi
