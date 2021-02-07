# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/20 21:39:55 by ancoulon          #+#    #+#              #
#    Updated: 2021/02/05 14:01:46 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

ARG MYSQL_USERNAME
ARG MYSQL_PASSWORD

VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

RUN apk update
RUN apk upgrade

RUN apk add mariadb mariadb-common mariadb-client

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

ADD telegraf.conf /etc/telegraf/telegraf.conf

RUN mkdir -p /run/mysqld && touch /run/mysqld/mysqld.sock

RUN mkdir -p /setup
ADD bootstrap.sql /setup/bootstrap.sql
ADD init.sh /setup/init.sh

RUN sed -i "s/MYSQL_USERNAME/$MYSQL_USERNAME/g" /setup/bootstrap.sql
RUN sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /setup/bootstrap.sql

CMD [ "/bin/ash", "/setup/init.sh" ]
