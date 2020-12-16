printf "\033[0;32mWe are goind to use the following private IP address : \033[0m\n"
MINIKUBE_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"
echo $MINIKUBE_IP
printf "\n\033[0;32mThen we can apply the configmap for metallb with this unique IP\033[0m\n"
sed -i -e "s/setminikubeip/$MINIKUBE_IP/g" ./metallb.yaml
kubectl apply -f ./metallb.yaml
sed -i -e "s/$MINIKUBE_IP/setminikubeip/g" ./metallb.yaml
