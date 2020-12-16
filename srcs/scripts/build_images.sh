printf "\033[0;32mBuilding mysql image...\033[0m\n"
docker build -t mysql --build-arg minikube_ip=$(minikube ip) ../mysql &>/dev/null
printf "\033[0;32mBuilding influxdb image...\033[0m\n"
docker build -t influxdb ../influxdb &>/dev/null
printf "\033[0;32mBuilding nginx image...\033[0m\n"
docker build -t nginx ../nginx &>/dev/null
printf "\033[0;32mBuilding wordpress image...\033[0m\n"
docker build -t wordpress ../wordpress &>/dev/null
printf "\033[0;32mBuilding phpmyadmin image...\033[0m\n"
docker build -t phpmyadmin ../phpmyadmin &>/dev/null
printf "\033[0;32mBuilding ftps image...\033[0m\n"
docker build -t ftps --build-arg minikube_ip=$(minikube ip) ../ftps &>/dev/null
printf "\033[0;32mBuilding grafana image...\033[0m\n"
docker build -t grafana ../grafana &>/dev/null
