# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ancoulon <ancoulon@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/20 14:12:58 by ancoulon          #+#    #+#              #
#    Updated: 2021/01/27 11:04:37 by ancoulon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

kubectl delete -f srcs/.
#minikube delete --all

minikube start --vm-driver=virtualbox

eval $(minikube docker-env)

docker build -t ft_services_mysql srcs/mysql/.
docker build -t ft_services_phpmyadmin srcs/phpmyadmin/.
docker build -t ft_services_wordpress srcs/wordpress/.
docker build -t ft_services_nginx srcs/nginx/.


kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/wordpress.yaml
kubectl apply -f srcs/nginx.yaml

minikube dashboard
