FROM alpine:latest

WORKDIR /var/www

RUN apk upgrade && apk add wget tar nginx php php7-fpm \
	php7-common php7-iconv php7-json php7-gd php7-curl php7-xml \
	php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
	php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext \
	php7-ldap php7-ctype php7-dom php7-session php7-mbstring

RUN mkdir -p /run/nginx && adduser -D -g 'www' www \
	&& chown -R www:www /var/lib/nginx \
	&& chown -R www:www /var/www

RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.4-all-languages.tar.gz \
	&& tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz \
	&& rm phpMyAdmin-5.0.4-all-languages.tar.gz \
	&& mv phpMyAdmin-5.0.4-all-languages phpmyadmin

COPY ./nginx.conf /etc/nginx/

COPY ./default.conf /etc/nginx/conf.d/

COPY ./run_nginx.sh /var/www/

COPY ./config.inc.php /var/www/phpmyadmin/

EXPOSE 5000

CMD ["sh", "run_nginx.sh"]
