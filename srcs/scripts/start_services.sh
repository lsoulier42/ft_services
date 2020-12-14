echo "Let's create persistent volume for mysql database, then start mysql service...\n"
kubectl create -f ../mysql/mysql.yaml
echo "Let's create persistant volume for InfluxDB database, then start influxdb service...\n"
kubectl create -f ../influxdb/influxdb.yaml
echo "Then we can start the other services : nginx, wordpress, phpmyadmin, ftps and grafana :\n"
kubectl create -f ../nginx/nginx.yaml
kubectl create -f ../wordpress/wordpress.yaml
kubectl create -f ../phpmyadmin/phpmyadmin.yaml
kubectl create -f ../grafana/grafana.yaml
kubectl create -f ../ftps/ftps.yaml
