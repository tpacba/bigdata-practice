MYSQL_TABLES="users
user_socials"

POSTGRES_TABLES="song_listened
youtube_watched
artist_events
creator_events
"

ORACLE_TABLES="
spotify_artists
spotify_songs
youtube_creators
youtube_videos
"

echo "Deleting directory /user/hadoop/input/mysql"
hdfs dfs -rm -r /user/hadoop/input/mysql

echo "Deleting directory /user/hadoop/input/postgres"
hdfs dfs -rm -r /user/hadoop/input/postgresql

echo "Deleting directory /user/hadoop/input/oracle"
hdfs dfs -rm -r /user/hadoop/input/oracle


for m in $MYSQL_TABLES
do
	echo "Importing to directory /user/hadoop/input/mysql/$m"
	sqoop job --exec mysql-import-$m
done


for p in $POSTGRES_TABLES
do
	echo "Importing to directory /user/hadoop/input/postgres/$p"
	sqoop job --exec postgres-import-$p
done


for o in $ORACLE_TABLES
do
	echo "Importing to directory /user/hadoop/input/oracle/$o"
	sqoop job --exec oracle-import-$o
done


echo "Bye"
