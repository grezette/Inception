sleep 15

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$WP_ADMIN' IDENTIFIED BY '$WP_ADMIN_PASSWORD';
CREATE USER IF NOT EXISTS '$WP_USER' IDENTIFIED BY '$WP_USER_PASSWORD';
GRANT ALL ON *.* TO '$WP_ADMIN' IDENTIFIED BY '$WP_ADMIN_PASSWORD';
GRANT ALL ON $MYSQL_DATABASE.* TO '$WP_USER' IDENTIFIED BY '$WP_USER_PASSWORD';
FLUSH PRIVILEGES;" > /tmp/mariadb_user.sql

mysql -u root --password=$MYSQL_ROOT_PASSWORD < /tmp/mariadb_user.sql

out=$(mysql -e "use DB; show tables")
if [[ -z $out ]];
then
	mysql -u root --password=$MYSQL_ROOT_PASSWORD < /tmp/wp-db.sql
	echo "db absente"
else
	echo "db presente"
fi

service mysql stop

exec "$@"
