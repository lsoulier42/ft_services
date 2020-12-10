docker ps
minikube start
eval $(minikube docker-env)
minikube addons enable dashboard
kubectl apply -f ./srcs/metallb/metallb.yaml
minikube addons enable metallb
bash build_images.sh
bash restart_services.sh
