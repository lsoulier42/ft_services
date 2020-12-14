echo "Building mysql image...\n"
docker build -t mysql --build-arg minikube_ip=$(minikube ip) ../mysql &>/dev/null
echo "Building nginx image...\n"
docker build -t nginx ../nginx &>/dev/null
echo "Building wordpress image...\n"
docker build -t wordpress ../wordpress &>/dev/null
echo "Building phpmyadmin image...\n"
docker build -t phpmyadmin ../phpmyadmin &>/dev/null
echo "Building ftps image...\n"
docker build -t ftps --build-arg minikube_ip=$(minikube ip) ../ftps &>/dev/null
echo "Building influxdb image...\n"
docker build -t influxdb ../influxdb &>/dev/null
echo "Building grafana image...\n"
docker build -t grafana ../grafana &>/dev/null
