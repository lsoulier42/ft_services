if [ "$#" -ne 1 ]; then
	echo "Vous devez passer le nom d'un service en argument"
else
  if [ "$1" = "mysql" ] || [ "$1" = "influxdb" ] ||  [ "$1" = "nginx" ] || [ "$1" = "ftps" ] || [ "$1" = "wordpress" ] || [ "$1" = "phpmyadmin" ] || [ "$1" = "grafana" ]; then
	  eval $(minikube docker-env)
	  if [ "$1" = "ftps" ] || [ "$1" = "mysql" ]; then
	    BUILD_ARG="--build-arg minikube_ip=$(minikube ip)"
	  else
	    BUILD_ARG=""
	  fi
	  docker image rm -f $1
	  docker build -t $1 $BUILD_ARG ../$1
	else
	  echo "Ce service n'existe pas\n"
	fi
fi
