use marketingdb;

#1
drop table if exists join_spotify_songs_artists;

create table join_spotify_songs_artists(song_id int, song_name string, artist_id int, name string)
stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
with serdeproperties("hbase.columns.mapping"=":key,x:song_name,x:artist_id,x:name");

insert into table join_spotify_songs_artists
select song_id,song_name,spotify_songs.artist_id,name 
from spotify_songs 
left join spotify_artists 
on spotify_songs.artist_id=spotify_artists.artist_id;

select * from join_spotify_songs_artists;


#2
drop table if exists join_youtube_videos_creators;

create table join_youtube_videos_creators(video_id int, video_name string, creator_id int, username string)
stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
with serdeproperties("hbase.columns.mapping"=":key,x:video_name,x:creator_id,x:username");

insert into table join_youtube_videos_creators
select video_id,video_name,youtube_videos.creator_id,username
from youtube_videos
left join youtube_creators
on youtube_videos.creator_id=youtube_creators.creator_id;

select * from join_youtube_videos_creators;


#3
drop table if exists join_artist_events;

create table join_artist_events(event_id int, event_name string, event_date date, artist_id int, name string, city string, state string, country string)
stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
with serdeproperties("hbase.columns.mapping"=":key,x:event_name,x:event_date,x:artist_id,x:name,x:city,x:state,x:country");

insert into table join_artist_events
select event_id,event_name,event_date,artist_events.artist_id,name,city,state,country
from artist_events
left join spotify_artists
on artist_events.artist_id=spotify_artists.artist_id;

select * from join_artist_events;


#4
drop table if exists join_creator_events;

create table join_creator_events(event_id int, event_name string, event_date date, creator_id int, username string, city string, state string, country string)
stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
with serdeproperties("hbase.columns.mapping"=":key,x:event_name,x:event_date,x:creator_id,x:username,x:city,x:state,x:country");

insert into table join_creator_events
select event_id,event_name,event_date,creator_events.creator_id,username,city,state,country
from creator_events
left join youtube_creators
on creator_events.creator_id=youtube_creators.creator_id;

select * from join_creator_events;


#5
drop table if exists join_user_socials;

create table join_user_socials(id int,user_id int,first_name string,last_name string,city string,state string,country string,social_site string,username_used string,email_used string)
stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
with serdeproperties("hbase.columns.mapping"=":key,x:user_id,x:first_name,x:last_name,x:city,x:state,x:country,x:social_site,x:username_used,x:email_used");

insert into table join_user_socials
select id,user_socials.user_id,first_name,last_name,city,state,country,social_site,username_used,email_used
from user_socials
left join users
on user_socials.user_id=users.user_id;

select * from join_user_socials;



#6
drop table if exists cnt_songs;

create table cnt_songs(artist_id int,name string,cnt_songs int)
stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
with serdeproperties("hbase.columns.mapping"=":key,x:name,x:cnt_songs");

insert into table cnt_songs
select artist_id,name,count(*) as cnt_songs
from join_spotify_songs_artists
group by artist_id,name;

select * from cnt_songs;









show tables;

















