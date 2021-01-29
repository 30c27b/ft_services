# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/29 14:26:28 by ancoulon          #+#    #+#              #
#    Updated: 2021/01/29 15:40:14 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

RUN apk update && apk upgrade

RUN apk add openssl
RUN apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN adduser -D keymaster
RUN echo "keymaster:password" | chpasswd

RUN mkdir -p /etc/ssl/private
RUN openssl req \
	-newkey rsa:2048 \
	-nodes \
	-keyout /etc/ssl/private/pure-ftpd.pem \
	-x509 \
	-days 365 \
	-out /etc/ssl/private/pure-ftpd.pem \
	-subj '/CN=BE'

ADD init.sh /setup/init.sh

EXPOSE 21 30001-30004

CMD [ "/bin/ash", "/setup/init.sh" ]
