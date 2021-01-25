# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/21 14:22:14 by ancoulon          #+#    #+#              #
#    Updated: 2021/01/21 14:32:10 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

RUN apk update

RUN apk add nginx

RUN mkdir -p

RUN mkdir -p /var/www/phpmyadmin
ADD index.html /var/www/localhost/index.html

RUN mkdir -p /run/nginx
ADD localhost.conf /etc/nginx/http.d/localhost.conf

EXPOSE 5000

CMD [ "nginx", "-g", "daemon off;" ]
