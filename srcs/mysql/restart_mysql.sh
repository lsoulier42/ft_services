kubectl delete deploy mysql
kubectl delete svc mysql
docker image rm -f mysql
docker build -t mysql .
kubectl create -f mysql.yaml
