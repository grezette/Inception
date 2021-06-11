mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE wordpress;"
mysql --user=root --password=$MYSQL_ROOT_PASSWORD -e "GRANT ALL ON wordpress.* TO '$MYSQL_USER' IDENTIFIED BY '$MYSQL_PASSWORD';"
