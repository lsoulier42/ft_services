kubectl create -f ./mysql/persistent_volume.yaml
kubectl create -f ./mysql/mysql.yaml
kubectl create -f ./nginx/nginx.yaml
kubectl create -f ./wordpress/wordpress.yaml
