if [ "$#" -ne 1 ]; then
	echo "Vous devez passer le nom du service en argument\n"
else
	if [ "$1" = "mysql" ] || [ "$1" = "influxdb" ] ||  [ "$1" = "nginx" ] || [ "$1" = "ftps" ] || [ "$1" = "wordpress" ] || [ "$1" = "phpmyadmin" ] || [ "$1" = "grafana" ]; then
	  eval $(minikube docker-env)
	  kubectl delete deploy $1
	  kubectl delete svc $1
	  if [ "$1" = "mysql" ] || [ "$1" = "influxdb" ]; then
		  kubectl delete pvc $1
		  kubectl delete pv $1
	  fi
	else
	  echo "Ce service n'existe pas\n"
	fi
fi