FROM alpine:latest

WORKDIR /var/www

RUN apk update && apk add nginx tar openssl telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
	&& mkdir -p /run/nginx && mkdir -p /etc/telegraf

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj '/C=FR/ST=FRANCE/L=Paris/O=42/CN=42.fr' \
	-addext 'subjectAltName=DNS:42.fr'

RUN adduser -D -g 'www' www && chown -R www:www /var/lib/nginx && chown -R www:www /var/www

COPY ./nginx.conf /etc/nginx/

COPY ./telegraf.conf /etc/telegraf/

COPY ./template.tar.gz /var/www/

RUN tar -xvf template.tar.gz -C /var/www/localhost

COPY ./run_nginx.sh /var/www/

EXPOSE 80 443

CMD ["sh", "run_nginx.sh"]
