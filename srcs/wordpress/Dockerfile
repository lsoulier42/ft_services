FROM alpine:latest

WORKDIR /var/www

RUN apk upgrade && apk add wget tar nginx php php7-common \
	php7-iconv php7-json php7-gd php7-curl php7-xml php7-opcache \
	php7-mysqli php7-imap php7-cgi php7-pdo php7-pdo_mysql \
	php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext \
	php7-ldap php7-ctype php7-dom php7-fpm openssl \
	telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/

RUN mkdir -p /run/nginx && adduser -D -g 'www' www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /var/www \
	&& mkdir -p /etc/telegraf

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj '/C=FR/ST=FRANCE/L=Paris/O=42/CN=42.fr' \
	-addext 'subjectAltName=DNS:42.fr'

RUN wget http://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz \
	&& rm latest.tar.gz \
	&& mv wordpress ./localhost/

COPY ./nginx.conf /etc/nginx/

COPY ./default.conf /etc/nginx/conf.d/

COPY ./run_wordpress.sh /var/www/

COPY ./telegraf.conf /etc/telegraf/

COPY ./wp-config.php /var/www/localhost/wordpress/

EXPOSE 5050

CMD ["sh", "run_wordpress.sh"]
