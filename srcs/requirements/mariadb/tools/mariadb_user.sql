CREATE DATABASE IF NOT EXIST $MYSQL_DATABASE;
CREATE USER IF NOT EXIST $WP_ADMIN@'%' IDENTIFIED BY '$WP_ADMIN_PASSWORD';
CREATE USER IF NOT EXIST $WP_USER@'%' IDENTIFIED BY '$WP_USER_PASSWORD';
GRANT ALL ON *.* TO '$WP_ADMIN_USER' IDENTIFIED BY '$WP_ADMIN_PASSWORD';
GRANT ALL ON $MYSQL_DATABASE.* TO '$WP_USER' IDENTIFIED BY '$WP_USER_PASSWORD';
FLUSH PRIVILEGES;"