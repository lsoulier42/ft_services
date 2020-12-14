echo "Starting ft_services project from 42 Paris School\n"
echo "This project was made by Louise Soulier - lsoulier\n"
echo "First we have to stop minikube if it's running\n"
minikube stop
echo "Then let's wake up docker\n"
docker ps
echo "We can start minikube\n"
minikube start
echo "Let's set the docker environment to minikube context\n"
eval $(minikube docker-env)
echo "Enabling the kubernetes dashboard...\n"
minikube addons enable dashboard
echo "Starting the bare metal LoadBalancer include with minikube...\n"
minikube addons enable metallb
chmod 755 ./srcs/scripts/apply_metallb_config.sh
./srcs/scripts/apply_metallb_config.sh
echo "We have to build docker images now :\n"
chmod 755 ./srcs/scripts/build_images.sh
./srcs/scripts/build_images.sh
echo "Then we can start services :\n"
chmod 755 ./srcs/scripts/start_services.sh
./srcs/scriptis/start_services.sh
echo "And finally we can start the dashboard and begin tests :\n"
minikube dashboard
