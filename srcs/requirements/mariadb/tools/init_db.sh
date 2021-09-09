sleep 20

mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXIST $MYSQL_DATABASE;"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXIST $WP_ADMIN@'%' IDENTIFIED BY '$WP_ADMIN_PASSWORD';"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXIST $WP_USER@'%' IDENTIFIED BY '$WP_USER_PASSWORD';"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON *.* TO '$WP_ADMIN_USER' IDENTIFIED BY '$WP_ADMIN_PASSWORD';"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$WP_USER' IDENTIFIED BY '$WP_USER_PASSWORD';"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

sleep 3

mysqladmin shutdown

sleep 3
