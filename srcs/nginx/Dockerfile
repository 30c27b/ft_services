# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/20 14:16:36 by ancoulon          #+#    #+#              #
#    Updated: 2021/01/28 13:01:51 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

RUN apk update && apk upgrade

RUN apk add openssh
RUN apk add nginx
RUN apk add openssl

RUN adduser -D keymaster
RUN echo "keymaster:password" | chpasswd
RUN ssh-keygen -A

RUN mkdir -p /setup/ssl
RUN openssl req \
	-newkey rsa:2048 \
	-nodes \
	-keyout /setup/ssl/certificate.key \
	-x509 \
	-days 365 \
	-out /setup/ssl/certificate.crt \
	-subj '/CN=localhost'

RUN mkdir -p /var/www/localhost
ADD index.html /var/www/localhost/index.html

RUN mkdir -p /run/nginx
RUN rm /etc/nginx/conf.d/default.conf
ADD localhost.conf /etc/nginx/conf.d/localhost.conf

COPY init.sh /setup/init.sh

EXPOSE 22 80 443

CMD [ "/bin/ash", "/setup/init.sh" ]
