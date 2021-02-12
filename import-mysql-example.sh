MYSQL_TABLES="
users
user_socials
"



for m in $MYSQL_TABLES
do
	sqoop job --create mysql-import-$m \
	-- import \
	--connect jdbc:mysql://localhost/database \
	--username root \
	--password-file /user/hadoop/pwd/mysql-pass.txt \
	--table $m -m 1 \
	--target-dir /user/hadoop/input/mysql/$m
	
	echo "Starting SQOOP JOB: mysql-import-$m"
	
	sqoop job --exec mysql-import-$m
done

echo "Bye"

# Note: "/user/hadoop/pwd/mysql-pass.txt" is the path to the txt file within the HDFS that contains my password for MYSQL. It avoids the console from prompting the password for every iteration.
