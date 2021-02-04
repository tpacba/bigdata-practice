use spotify_user_end;

create table user(
	id int auto_increment,
	username varchar(255),
	firstname varchar(255),
	lastname varchar(255),
	email varchar(255),
	city varchar(255),
	state varchar(255),
	country varchar(255),
	primary key(id)
);

create table user_socials(
	instagram varchar(255),
	facebook varchar(255),
	twitter varchar(255)
)

create table user_liked_playlists(
	id int auto_increment,
	playlist_id int references playlist(id),
	playlist_name varchar(255),
	time_listened int,
	primary key(id)
);

create table user_liked_albums(
	id int auto_increment,
	album_id int,
	album_name varchar(255),
	time_listened int,
	primary key(id)
);

create table user_liked_artists(
	id int auto_increment,
	artist_id int,
	artist_name varchar(255),
	time_listened int,
	primary key (id)
);

create table user_liked_songs(
	id int auto_increment,
	song_id int,
	song_name varchar(255),
	time_listened int,
	primary key(id)
);
