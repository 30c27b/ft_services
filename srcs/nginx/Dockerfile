# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/20 14:16:36 by ancoulon          #+#    #+#              #
#    Updated: 2021/02/02 18:54:55 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

ARG SSH_USERNAME
ARG SSH_PASSWORD

EXPOSE 22 80 443

RUN apk update
RUN apk upgrade

RUN apk add openssh
RUN apk add nginx
RUN apk add openssl

RUN adduser -D $SSH_USERNAME
RUN echo "$SSH_USERNAME:$SSH_PASSWORD" | chpasswd
RUN ssh-keygen -A

RUN mkdir -p /setup/ssl
RUN openssl req \
	-newkey rsa:2048 \
	-nodes \
	-keyout /setup/ssl/certificate.key \
	-x509 \
	-days 365 \
	-out /setup/ssl/certificate.crt \
	-subj '/CN=BE'

RUN mkdir -p /var/www/localhost
ADD index.html /var/www/localhost/index.html

RUN mkdir -p /run/nginx
RUN rm /etc/nginx/conf.d/default.conf
ADD localhost.conf /etc/nginx/conf.d/localhost.conf

ADD init.sh /setup/init.sh

CMD [ "/bin/ash", "/setup/init.sh" ]
