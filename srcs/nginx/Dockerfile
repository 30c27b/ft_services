# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/20 14:16:36 by ancoulon          #+#    #+#              #
#    Updated: 2021/01/20 15:58:36 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

LABEL maintainer="ancoulon <ancoulon@student.s19.be>"

RUN apk update

RUN apk add nginx
RUN apk add openssl

RUN mkdir /ssl
RUN openssl req -batch -newkey rsa:2048 -nodes -keyout /ssl/certificate-key.pem -x509 -days 365 -out /ssl/certificate.pem

RUN mkdir -p /var/www/localhost
ADD index.html /var/www/localhost/index.html

RUN mkdir -p /run/nginx
ADD localhost.conf /etc/nginx/http.d/localhost.conf

EXPOSE 80
EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
