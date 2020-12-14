docker ps
minikube start
eval $(minikube docker-env)
minikube addons enable dashboard
minikube addons enable metallb
kubectl apply -f ./srcs/metallb/metallb.yaml
bash build_images.sh
bash restart_services.sh
