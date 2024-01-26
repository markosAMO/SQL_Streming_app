create database if not exists streaming_platform;

Use streaming_platform;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    last_name VARCHAR(100),
    address_1 VARCHAR(100),
    address_2 VARCHAR(100),
    country VARCHAR(100),
    dni int,
    duration TIME
);

CREATE TABLE IF NOT EXISTS songs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    duration TIME
);

CREATE TABLE IF NOT EXISTS artists (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description text
);

create table if not exists collections(
	id int primary key auto_increment,
    type VARCHAR(100),
    name VARCHAR(100),
    photo text
);

create table if not exists genres(
	id int primary key auto_increment,
    name VARCHAR(100)
);

create table if not exists formats(
	id int primary key auto_increment,
    name VARCHAR(100),
    quality VARCHAR(100)
);

create table if not exists suscriptions(
	id int primary key auto_increment,
    description text,
    name VARCHAR(100),
    country VARCHAR(100),
    cost float
);

create table if not exists bills(
	id int primary key auto_increment,
    id_user int,
    id_suscription int,
    payment_date datetime,
    ticket int,
    date datetime,
    price float,
    foreign key (id_user) references users(id),
    foreign key (id_suscription) references suscriptions(id)
);

create table if not exists playlists(
	id int primary key auto_increment,
    id_user int,
    name VARCHAR(100),
    playlist_number int,
    foreign key (id_user) references users(id)
);

create table if not exists song_format(
	id int primary key auto_increment,
    id_song int,
    id_format int,
    foreign key (id_format) references formats(id),
    foreign key (id_song) references songs(id)
);

create table if not exists song_genre(
	id int primary key auto_increment,
    id_song int,
    id_genre int,
    foreign key (id_genre) references genres(id),
    foreign key (id_song) references songs(id)
);

create table if not exists collection_songs(
	id int primary key auto_increment,
    id_collection int,
    id_song int,
    foreign key (id_collection) references collections(id),
    foreign key (id_song) references songs(id)
);

create table if not exists artists_songs(
	id int primary key auto_increment,
    id_artist int,
    id_song int,
    foreign key (id_artist) references artists(id),
    foreign key (id_song) references songs(id)
);

create table if not exists user_follows(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_user_1 int,
    id_user_2 int,
    foreign key (id_user_1) references users(id),
    foreign key (id_user_2) references users(id)
);

create table if not exists song_favorites(
	id int primary key auto_increment,
	id_song int,
    id_user int,
    foreign key (id_song) references songs(id),
    foreign key (id_user) references users(id)
);

create table if not exists collection_favorites(
	id int primary key auto_increment,
    id_collection int,
    id_user int,
    foreign key (id_collection) references collections(id),
    foreign key (id_user) references users(id)
);

