FROM alpine:latest

WORKDIR /home

RUN apk update && apk add influxdb \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/	\
	&& mkdir -p /var/lib/influxdb \
	&& mkdir -p /etc/influxdb && mkdir -p /etc/telegraf

RUN chown -R influxdb:influxdb /var/lib/influxdb

COPY ./run_influxdb.sh /home/

VOLUME ["/var/lib/influxdb"]

EXPOSE 8086

CMD ["sh", "run_influxdb.sh"]
