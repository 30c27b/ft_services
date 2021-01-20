# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/20 14:16:36 by ancoulon          #+#    #+#              #
#    Updated: 2021/01/20 14:53:32 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update

RUN apk add nginx
RUN apk add openssh

RUN mkdir /ssl
RUN openssl req -newkey rsa:2048 -nodes -keyout /ssl/certificate-key.pem -x509 -days 365 -out /ssl/certificate.pem

RUN mkdir -p /www/localhost
ADD srcs/index.html /www/localhost/index.html
