kubectl delete deploy ftps
kubectl delete svc ftps
docker image rm -f ftps
docker build -t ftps .
kubectl create -f ftps.yaml
