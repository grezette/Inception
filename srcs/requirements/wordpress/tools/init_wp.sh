if [ ! -e '/var/www/html/wordpress' ]
then
	mkdir wordpress
	cd wordpress
	wp core download --allow-root
fi 
