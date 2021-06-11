if [! -e '/var/www/html/wordpress' ]
then
	mv /tmp/wp-comfig.php wordpress/
	mv wordpress/* /var/www/html/
fi
