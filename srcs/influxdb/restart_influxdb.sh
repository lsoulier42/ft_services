kubectl delete deploy influxdb
kubectl delete svc influxdb
kubectl delete pvc influxdb
kubectl delete pv influxdb
docker image rm -f influxdb
docker build -t influxdb .
kubectl create -f influxdb.yaml
