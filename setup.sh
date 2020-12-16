printf "\033[0;32mStarting ft_services project from 42 Paris School\033[0m\n"
printf "\033[0;32mThis project was made by Louise Soulier - lsoulier\033[0m\\n"
printf "\033[0;32mLet's start by getting sudo rights for docker\033[0m\n"
sudo usermod -aG docker $(whoami);
printf "\033[0;32mLet's get a clean minikube VM\033[0m\n"
minikube delete
printf "\033[0;32mWe can start minikube\033[0m\n"
minikube start --vm-driver=docker
printf "\033[0;32mLet's set the docker environment to minikube context\033[0m\n"
eval $(minikube docker-env)
printf "\033[0;32mEnabling the kubernetes dashboard...\033[0m\\n"
minikube addons enable metrics-server
minikube addons enable dashboard
printf "\033[0;32mStarting the LoadBalancer include with minikube...\033[0m\n"
kubectl get configmap kube-proxy -n kube-system -o yaml | sed -e "s/strictARP: false/strictARP: true/" | kubectl diff -f - -n kube-system
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
minikube addons enable metallb
cd ./srcs/scripts
bash apply_metallb_config.sh
printf "\033[0;32mWe have to build docker images now :\033[0m\n"
bash build_images.sh
printf "\033[0;32mThen we can start services :\033[0m\n"
bash start_services.sh
printf "\033[0;32mAnd finally we can start the dashboard and begin tests :\033[0m\n"
minikube dashboard
