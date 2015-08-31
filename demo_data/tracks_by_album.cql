CREATE KEYSPACE music
WITH replication = {
  'class': 'SimpleStrategy', 
  'replication_factor' : 1
};

USE music;

CREATE TABLE tracks_by_album (
  album_title TEXT,
  album_year INT,
  performer TEXT STATIC,
  album_genre TEXT STATIC,
  track_number INT,
  track_title TEXT,
  PRIMARY KEY ((album_title, album_year), track_number)
);

COPY tracks_by_album 
     (album_title, album_year, performer, album_genre, track_number, track_title) 
FROM 'tracks_by_album.csv' 
WITH HEADER = 'true';

