# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/02 10:21:13 by ancoulon          #+#    #+#              #
#    Updated: 2021/02/07 20:26:20 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

EXPOSE 3000

RUN apk update
RUN apk upgrade

RUN apk add wget

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN apk add libc6-compat --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main

ADD telegraf.conf /etc/telegraf/telegraf.conf

ADD https://dl.grafana.com/oss/release/grafana-7.4.0.linux-amd64.tar.gz /
RUN tar -zxvf grafana-7.4.0.linux-amd64.tar.gz
RUN	rm -f grafana-7.4.0.linux-amd64.tar.gz
RUN mv grafana-7.4.0/ grafana/
RUN mv grafana/bin/* /usr/local/bin/
ADD grafana.db /grafana/data/grafana.db

RUN mkdir -p /setup
ADD init.sh /setup/init.sh

CMD [ "/bin/ash", "/setup/init.sh" ]
