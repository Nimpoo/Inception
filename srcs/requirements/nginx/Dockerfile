# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sihemayoub <sihemayoub@student.42.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/18 21:13:18 by sihemayoub        #+#    #+#              #
#    Updated: 2023/05/22 14:16:41 by sihemayoub       ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17.3

RUN apk upgrade && apk update && apk add --no-cache nginx

COPY "requirements/nginx/conf/nginx.conf" "/etc/nginx/http.d/nginx.conf"  

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]

