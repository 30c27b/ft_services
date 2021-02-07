# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/01 09:48:13 by ancoulon          #+#    #+#              #
#    Updated: 2021/02/05 14:15:47 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

VOLUME [ "/var/lib/influxdb" ]

EXPOSE 8086

RUN apk update
RUN apk upgrade

RUN apk add influxdb

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

ADD telegraf.conf /etc/telegraf/telegraf.conf

ADD influxdb.conf /etc/influxdb/influxdb.conf

RUN mkdir -p /setup
ADD init.sh /setup/init.sh

CMD [ "/bin/ash", "/setup/init.sh" ]
