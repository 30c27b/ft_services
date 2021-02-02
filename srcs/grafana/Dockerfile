# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/02 10:21:13 by ancoulon          #+#    #+#              #
#    Updated: 2021/02/02 11:28:35 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

EXPOSE 3000

RUN apk update
RUN apk upgrade

RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN mkdir -p /setup
ADD init.sh /setup/init.sh

CMD [ "/bin/ash", "/setup/init.sh" ]
