# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/01 09:48:13 by ancoulon          #+#    #+#              #
#    Updated: 2021/02/02 10:14:42 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

VOLUME [ "/var/lib/influxdb" ]

EXPOSE 8086

RUN apk update
RUN apk upgrade

RUN apk add influxdb

COPY influxdb.conf /etc/influxdb/influxdb.conf

RUN mkdir -p /setup
ADD init.sh /setup/init.sh

CMD [ "/bin/ash", "/setup/init.sh" ]
