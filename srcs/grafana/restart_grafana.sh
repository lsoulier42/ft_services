./destroy_grafana.sh
docker image rm -f grafana
docker build -t grafana .
kubectl create -f grafana.yaml
