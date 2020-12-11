FROM alpine:latest

WORKDIR /home

RUN apk upgrade && apk add vsftpd openssl

RUN { echo "ftp_password"; echo "ftp_password"; } | adduser ftp_user

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/vsftpd.key \
	-out /etc/ssl/certs/vsftpd.crt \
	-subj '/C=FR/ST=FRANCE/L=Paris/O=42/CN=42.fr' \
	-addext 'subjectAltName=DNS:42.fr'

COPY ./vsftpd.conf /etc/vsftpd/ 

COPY ./run_ftps.sh /home/

EXPOSE 21 20 30000 30001

CMD ["sh", "run_ftps.sh"]
