chmod -R  777 /var/www/
su - wp -c 'wp core is-installed --path=/www/wordpress'

if [ $? == 1 ]; then
su - wp -c 'wp core install --url=$DOMAIN_NAME --title=efukt --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=info@example.com --skip-email --path=/www/wordpress/'
su - wp -c 'wp user create test3 test3@example.com --role=contributor --path=/www/wordpress'
fi
