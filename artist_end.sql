CREATE TABLE artists(
	artist_id NUMBER(5),
	artist_name varchar2(15)
)

CREATE TABLE artist_albums(
	album_id NUMBER(5),
	album_name varchar2(15),
	release_date DATE,
	genre varchar2(15)
)

CREATE TABLE albums(
	song_id NUMBER(5),
	song_name varchar2(15)
)

CREATE TABLE artist_events(
	artist_id NUMBER(5),
	event_id NUMBER(5),
	event_name varchar2(15),
	location_city varchar2(15),
	location_state varchar2(15),
	location_country varchar2(15)
)

CREATE TABLE artist_socials(
	artist_id NUMBER(5),
	instagram varchar2(15),
	facebook varchar2(15),
	twitter varchar2(15)
)
