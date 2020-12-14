kubectl delete deploy phpmyadmin
kubectl delete svc phpmyadmin
docker image rm -f phpmyadmin
docker build -t phpmyadmin .
kubectl create -f phpmyadmin.yaml
