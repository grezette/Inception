if (!(find $HOME/ -type d -name "data") || !(find $HOME/data/ -type d -name "dbdata" ) || !(find $HOME/data/ -type d -name "wordpress"))
	then mkdir -p $HOME/data/dbdata  $HOME/data/wordpress
fi

