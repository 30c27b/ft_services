# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/20 21:39:55 by ancoulon          #+#    #+#              #
#    Updated: 2021/01/20 22:03:52 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

RUN apk update

RUN apk add mariadb mariadb-client

RUN mkdir -p /config
ADD setup.sql /config/setup.sql

RUN mkdir -p /run/mysqld
RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql


EXPOSE 3306

CMD [ "/bin/ash" ]