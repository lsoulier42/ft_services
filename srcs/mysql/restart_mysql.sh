./destroy_mysql.sh
docker image rm -f mysql
docker build -t mysql .
kubectl create -f mysql.yaml
