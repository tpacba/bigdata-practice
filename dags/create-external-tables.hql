use marketingdb;

-- MYSQL_TABLES --

drop table if exists users;

create external table users(birthdate date, city string, country string, first_name string, last_name string, state string, user_id int)
row format delimited
fields terminated by ','
location '/user/hadoop/input/mysql/users';

drop table if exists user_socials;

create external table user_socials(email_used string,id int, social_site string, user_id int, username_used string)
row format delimited
fields terminated by ','
location '/user/hadoop/input/mysql/user_socials';



-- POSTGRESQL_TABLES --

drop table if exists song_listened;

create external table song_listened(id int, song_id int, date_listened date, user_id int)
row format delimited
fields terminated by ','
location '/user/hadoop/input/postgresql/song_listened';

drop table if exists youtube_watched;

create external table youtube_watched(id int, video_id int, date_watched date, user_id int)
row format delimited
fields terminated by ','
location '/user/hadoop/input/postgresql/youtube_watched';

drop table if exists artist_events;

create external table artist_events(event_id int, event_name string, event_date date, artist_id int, city string, state string, country string)
row format delimited
fields terminated by ','
location '/user/hadoop/input/postgresql/artist_events';

drop table if exists creator_events;

create external table creator_events(event_id int, event_name string, event_date date, creator_id int, city string, state string, country string)
row format delimited
fields terminated by ','
location '/user/hadoop/input/postgresql/creator_events';



-- ORACLE TABLES --

drop table if exists spotify_artists;

create external table spotify_artists(artist_id int, name string)
row format delimited
fields terminated by ','
location '/user/hadoop/input/oracle/spotify_artists';

drop table if exists spotify_songs;

create external table spotify_songs(song_id int, song_name string, artist_id int)
row format delimited
fields terminated by ','
location '/user/hadoop/input/oracle/spotify_songs';

drop table if exists youtube_creators;

create external table youtube_creators(creator_id int, username string)
row format delimited
fields terminated by ','
location '/user/hadoop/input/oracle/youtube_creators';

drop table if exists youtube_videos;

create external table youtube_videos(video_id int, video_name string, creator_id int)
row format delimited
fields terminated by ','
location '/user/hadoop/input/oracle/youtube_videos';

show tables;
