kubectl delete deploy nginx
kubectl delete svc nginx
docker image rm -f nginx
docker build -t nginx .
kubectl create -f nginx.yaml
