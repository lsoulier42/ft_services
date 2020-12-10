chown -R mysql:mysql /var/lib/mysql
mysql_install_db --user=mysql --ldata=/var/lib/mysql
mysqld --user=mysql --bootstrap --verbose=0 < create_db.sql
mysqld --user=mysql --console
