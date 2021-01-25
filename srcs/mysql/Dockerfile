# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/20 21:39:55 by ancoulon          #+#    #+#              #
#    Updated: 2021/01/25 17:29:28 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

RUN apk update

RUN apk add mariadb mariadb-common mariadb-client

RUN mkdir -p /run/mysqld && touch /run/mysqld/mysqld.sock

RUN mkdir -p /setup
ADD config.sql /setup/config.sql
ADD init.sh /setup/init.sh

EXPOSE 3306

CMD [ "/bin/ash", "/setup/init.sh" ]
