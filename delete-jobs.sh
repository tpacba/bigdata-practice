JOBS_TO_DELETE="
mysql-import-user_socials
mysql-import-users
oracle-import-artist_events
oracle-import-creator_events
oracle-import-spotify_artists
oracle-import-spotify_songs
oracle-import-youtube_creators
oracle-import-youtube_videos
postgres-import-song_listened
postgres-import-youtube_watched
"

for d in $JOBS_TO_DELETE
do
	sqoop job --delete $d
done
