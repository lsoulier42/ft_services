chown -R influxdb:influxdb /var/lib/influxdb
telegraf
influxd run -config /etc/influxdb.conf
