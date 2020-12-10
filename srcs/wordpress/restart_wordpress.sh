kubectl delete deploy wordpress
kubectl delete svc wordpress
docker image rm -f wordpress
docker build -t wordpress .
kubectl create -f wordpress.yaml
