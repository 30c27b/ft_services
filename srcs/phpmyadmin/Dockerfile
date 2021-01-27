# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/26 12:28:37 by ancoulon          #+#    #+#              #
#    Updated: 2021/01/27 11:44:31 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

RUN apk update && apk upgrade

RUN apk add openrc
RUN apk add nginx
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib \
	php7-curl php7-mbstring php7-json php7-session

RUN mkdir -p /var/www/phpmyadmin
ADD phpmyadmin /var/www/phpmyadmin

RUN mkdir -p /run/nginx
RUN rm /etc/nginx/conf.d/default.conf
ADD phpmyadmin.conf /etc/nginx/conf.d/phpmyadmin.conf

ADD init.sh /setup/init.sh

EXPOSE 5000

CMD [ "/bin/ash", "/setup/init.sh" ]
