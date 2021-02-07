#!/usr/bin/env bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/20 14:12:58 by ancoulon          #+#    #+#              #
#    Updated: 2021/02/03 11:42:54 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

kubectl delete -f srcs/.
minikube delete --all

# CREDENTIALS
FTPS_USERNAME=ftps
FTPS_PASSWORD=pass
MYSQL_USERNAME=mysql
MYSQL_PASSWORD=pass
SSH_USERNAME=ssh
SSH_PASSWORD=pass
GRAFANA_USERNAME=grafana
GRAFANA_PASSWORD=pass

# PARAMETERS
MINKIKUBE_FLAGS=--vm-driver=virtualbox

# STARTING MINIKUBE
minikube start $MINKIKUBE_FLAGS

# SWITCHING DOCKER ENV
eval $(minikube docker-env)

# BUILDING IMAGES
docker build -t ft_services_mysql srcs/mysql/. --build-arg MYSQL_USERNAME=$MYSQL_USERNAME --build-arg MYSQL_PASSWORD=$MYSQL_PASSWORD

docker build -t ft_services_ftps srcs/ftps/. --build-arg EXTERNAL_IP=192.168.99.240 --build-arg FTPS_USERNAME=$FTPS_USERNAME --build-arg FTPS_PASSWORD=$FTPS_PASSWORD

docker build -t ft_services_phpmyadmin srcs/phpmyadmin/.

docker build -t ft_services_wordpress srcs/wordpress/.

docker build -t ft_services_nginx srcs/nginx/. --build-arg SSH_USERNAME=$SSH_USERNAME --build-arg SSH_PASSWORD=$SSH_PASSWORD

docker build -t ft_services_influxdb srcs/influxdb/.

docker build -t ft_services_grafana srcs/grafana/.

# INSTALLING METALLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# APPLYING SERVICES AND DEPLOYEMENTS
kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/ftps.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/wordpress.yaml
kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/influxdb.yaml
kubectl apply -f srcs/grafana.yaml

sleep 10

# IMPORTING WORDPRESS CONFIG TO MYSQL DATABASE
kubectl exec -i `kubectl get pods | grep -o "\S*mysql\S*"` -- mysql wordpress -u root < srcs/mysql/wordpress.sql

# OPENING DASHBOARD
minikube dashboard
