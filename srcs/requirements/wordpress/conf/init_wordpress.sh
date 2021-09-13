chmod -R  777 /var/www/wordpress

sed -i "s/TO_REPLACE_DB_USER/$WP_ADMIN/g" /var/www/wordpress/wp-config.php
sed -i "s/TO_REPLACE_DB_PASSWORD/$WP_ADMIN_PASSWORD/g" /var/www/wordpress/wp-config.php
sed -i "s/TO_REPLACE_DB_HOST/$WP_DB_HOST/g" /var/www/wordpress/wp-config.php
sed -i "s/TO_REPLACE_DB_NAME/$MYSQL_DATABASE/g" /var/www/wordpress/wp-config.php

#echo "listen 0.0.0.0.9000" >> /etc/php/7.3/fpm/pool.d/www.conf

su - wp -c 'wp core is-installed --path=/var/www/wordpress'

if [ "$?" != 0 ]; then
	su - wp -c 'wp core install --url=$DOMAIN_NAME --title=efukt --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=info@example.com --skip-email --path=/var/www/wordpress/'
su - wp -c 'wp user create test3 test3@example.com --role=contributor --path=/var/www/wordpress'
fi
