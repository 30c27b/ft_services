# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/27 10:47:32 by ancoulon          #+#    #+#              #
#    Updated: 2021/02/05 14:03:08 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

EXPOSE 5050

RUN apk update
RUN apk upgrade

RUN apk add openrc
RUN apk add nginx
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib \
	php7-curl php7-mbstring php7-json php7-session

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

ADD telegraf.conf /etc/telegraf/telegraf.conf

RUN mkdir -p /var/www/wordpress
ADD wordpress /var/www/wordpress

RUN mkdir -p /run/nginx
RUN rm /etc/nginx/conf.d/default.conf
ADD wordpress.conf /etc/nginx/conf.d/wordpress.conf

COPY init.sh /setup/init.sh

CMD [ "/bin/ash", "/setup/init.sh" ]
