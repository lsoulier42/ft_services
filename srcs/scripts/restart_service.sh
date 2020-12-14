if [ "$#" -ne 1 ]; then
	echo "Vous devez passer le nom du service en argument\n"
else
	if [ "$1" = "mysql" ] || [ "$1" = "influxdb" ] ||  [ "$1" = "nginx" ] || [ "$1" = "ftps" ] || [ "$1" = "wordpress" ] || [ "$1" = "phpmyadmin" ] || [ "$1" = "grafana" ]; then
	  eval $(minikube docker-env)
    ./destroy_service.sh $1
    kubectl create -f ../$1/$1.yaml
	else
	  echo "Ce service n'existe pas\n"
	fi
fi	
