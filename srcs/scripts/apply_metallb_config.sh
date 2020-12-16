printf "\033[0;32mTake a look at minikube IP : \033[0m"
MINIKUBE_IP=$(minikube ip)
echo $MINIKUBE_IP 
printf "\n\033[0;32mThen we can apply the configmap for metallb with this unique IP\033[0m\n"
sed -i -e "s/setminikubeip/$MINIKUBE_IP/g" ./metallb.yaml
kubectl apply -f ./metallb.yaml
sed -i -e "s/$MINIKUBE_IP/setminikubeip/g" ./metallb.yaml
