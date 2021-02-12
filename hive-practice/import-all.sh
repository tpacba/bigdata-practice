MYSQL_TABLES="users
user_socials"

POSTGRES_TABLES="song_listened
youtube_watched
"



for m in $MYSQL_TABLES
do
	sqoop job --create mysql-import-$m \
	-- import \
	--connect jdbc:mysql://localhost/marketing \
	--username root \
	--password-file /user/hadoop/pwd/mysql-pass.txt \
	--table $m -m 1 \
	--target-dir /user/hadoop/input/mysql/$m
	
	echo "Starting SQOOP JOB: mysql-import-$m"
	
	sqoop job --exec mysql-import-$m
done



for p in $POSTGRES_TABLES
do
	sqoop job --create postgres-import-$p \
	-- import \
	--connect jdbc:postgresql://localhost:5432/postgres \
	--username postgres \
	--password-file /user/hadoop/pwd/postgres-pass.txt \
	--table $p -m 1 \
	--target-dir /user/hadoop/input/postgresql/$p
	
	echo "Starting SQOOP JOB: postgres-import-$p"
	
	sqoop job --exec postgres-import-$p
done



sqoop job --create oracle-import-artist_events \
-- import \
--connect jdbc:oracle:thin:@localhost:1521:xe \
--username hr \
--password-file /user/hadoop/pwd/oracle-pass.txt \
--table artist_events \
--columns event_id,event_name,event_date,artist_id,city,state,country \
--target-dir /user/hadoop/input/oracle/artist_events -m 1
	
echo "Starting SQOOP JOB: oracle-import-artist_events"
	
sqoop job --exec oracle-import-artist_events



sqoop job --create oracle-import-creator_events \
-- import \
--connect jdbc:oracle:thin:@localhost:1521:xe \
--username hr \
--password-file /user/hadoop/pwd/oracle-pass.txt \
--table creator_events \
--columns event_id,event_name,event_date,creator_id,city,state,country \
--target-dir /user/hadoop/input/oracle/creator_events -m 1
	
echo "Starting SQOOP JOB: oracle-import-creator_events"
	
sqoop job --exec oracle-import-creator_events



sqoop job --create oracle-import-spotify_artists \
-- import \
--connect jdbc:oracle:thin:@localhost:1521:xe \
--username hr \
--password-file /user/hadoop/pwd/oracle-pass.txt \
--table spotify_artists \
--columns artist_id,name \
--target-dir /user/hadoop/input/oracle/spotify_artists -m 1
	
echo "Starting SQOOP JOB: oracle-import-spotify_artists"
	
sqoop job --exec oracle-import-spotify_artists



sqoop job --create oracle-import-spotify_songs \
-- import \
--connect jdbc:oracle:thin:@localhost:1521:xe \
--username hr \
--password-file /user/hadoop/pwd/oracle-pass.txt \
--table spotify_songs \
--columns song_id,song_name,artist_id \
--target-dir /user/hadoop/input/oracle/spotify_songs -m 1
	
echo "Starting SQOOP JOB: oracle-import-spotify_songs"
	
sqoop job --exec oracle-import-spotify_songs



sqoop job --create oracle-import-youtube_creators \
-- import \
--connect jdbc:oracle:thin:@localhost:1521:xe \
--username hr \
--password-file /user/hadoop/pwd/oracle-pass.txt \
--table youtube_creators \
--columns creator_id,username \
--target-dir /user/hadoop/input/oracle/youtube_creators -m 1
	
echo "Starting SQOOP JOB: oracle-import-youtube_creators"
	
sqoop job --exec oracle-import-youtube_creators



sqoop job --create oracle-import-youtube_videos \
-- import \
--connect jdbc:oracle:thin:@localhost:1521:xe \
--username hr \
--password-file /user/hadoop/pwd/oracle-pass.txt \
--table youtube_videos \
--columns video_id,video_name,creator_id \
--target-dir /user/hadoop/input/oracle/youtube_videos -m 1
	
echo "Starting SQOOP JOB: oracle-import-youtube_videos"
	
sqoop job --exec oracle-import-youtube_videos

echo "Bye"
