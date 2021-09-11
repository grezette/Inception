if (!(find ../../ -type d -name "data") || !(find ../../data/ -type d -name "dbdata" ) || !(find ../../data/ -type d -name "wordpress"))
	then mkdir -p ../../data/dbdata mkdir ../../data/wordpress
fi

