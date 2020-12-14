echo "Take a look at minikube IP\n "
MINIKUBE_IP=$(minikube ip)
echo "Then we can apply the configmap for metallb with this unique IP\n"
sed -i -e "s/setminikubeip/$MINIKUBE_IP/g" ./metallb.yaml
kubectl apply -f ./metallb.yaml
sed -i -e "s/$MINIKUBE_IP/setminikubeip/g" ./metallb.yaml