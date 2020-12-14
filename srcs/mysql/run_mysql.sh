if [ -z "$(ls -A /var/lib/mysql)" ]; then
	mysql_install_db --user=root --ldata=/var/lib/mysql
	mysqld --user=root --pid_file=/run/mysqld/mysqld.pid &
	usleep 1000000
	mysql -u root --skip-password < create_db.sql
	kill $(cat /run/mysqld/mysqld.pid)
	usleep 1000000
	mysqld --user=root
else
	chown -R mysql:mysql /var/lib/mysql
	mysqld --user=root
fi	
