printf "\033[0;32mLet's create persistent volume for mysql database, then start mysql service...\033[0m\n"
kubectl create -f ../mysql/mysql.yaml
printf "\033[0;32mLet's create persistant volume for InfluxDB database, then start influxdb service...\033[0m\n"
kubectl create -f ../influxdb/influxdb.yaml
printf "\033[0;32mWe have to wait a few sconds for the database to fully initialyse\033[0m\n"
sleep 30
printf "\033[0;32mThen we can start the other services : nginx, wordpress, phpmyadmin, ftps and grafana :\033[0m\n"
kubectl create -f ../nginx/nginx.yaml
kubectl create -f ../wordpress/wordpress.yaml
kubectl create -f ../phpmyadmin/phpmyadmin.yaml
kubectl create -f ../ftps/ftps.yaml
kubectl create -f ../grafana/grafana.yaml
