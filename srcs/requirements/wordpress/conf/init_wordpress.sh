chmod -R  777 /var/www/wordpress

echo "listen 0.0.0.0.9000" >> /etc/php/7.3/fpm/pool.d/www.conf

su - wp -c 'wp core is-installed --path=/var/www/wordpress'

if [ $? == 1 ]; then
su - wp -c 'wp core install --url=$DOMAIN_NAME --title=efukt --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=info@example.com --skip-email --path=/var/www/wordpress/'
su - wp -c 'wp user create test3 test3@example.com --role=contributor --path=/var/www/wordpress'
fi
