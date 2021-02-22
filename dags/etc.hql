drop table if exists join_spotify_songs_artists;

create table join_spotify_songs_artists(song_id int, song_name string, artist_id int, name string)
row format delimited
fields terminated by ',';

insert overwrite table join_spotify_songs_artists
select song_id,song_name,spotify_songs.artist_id,name 
from spotify_songs 
left join spotify_artists 
on spotify_songs.artist_id=spotify_artists.artist_id;

select * from join_spotify_songs_artists;
