# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/29 14:26:28 by ancoulon          #+#    #+#              #
#    Updated: 2021/01/29 16:20:21 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

ARG EXTERNAL_IP
ARG FTPS_USERNAME
ARG FTPS_PASSWORD

ENV EXTERNAL_IP=${EXTERNAL_IP}

EXPOSE 21 30000-30004

RUN apk update
RUN apk upgrade

RUN apk add openssl
RUN apk add pure-ftpd \
	--repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
	--allow-untrusted

RUN adduser -D ${FTPS_USERNAME}
RUN echo "${FTPS_USERNAME}:${FTPS_PASSWORD}" | chpasswd

RUN mkdir -p /etc/ssl/private
RUN openssl req \
	-newkey rsa:2048 \
	-nodes \
	-keyout /etc/ssl/private/pure-ftpd.pem \
	-x509 \
	-days 365 \
	-out /etc/ssl/private/pure-ftpd.pem \
	-subj '/CN=BE'

RUN mkdir -p /setup
ADD init.sh /setup/init.sh

CMD [ "/bin/ash", "/setup/init.sh" ]
