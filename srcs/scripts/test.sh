MINIKUBE_IP=$(minikube ip)
sed -i -e "s/$MINIKUBE_IP/setminikubeip/g" ./metallb.yaml
