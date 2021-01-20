# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/20 14:12:58 by ancoulon          #+#    #+#              #
#    Updated: 2021/01/20 20:58:19 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

kubectl delete -f srcs/.
minikube delete --all

minikube start --driver=docker

eval $(minikube docker-env)

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

docker build -t ft_services_nginx srcs/nginx/.

kubectl create -f srcs/.

minikube dashboard
