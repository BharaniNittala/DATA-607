/*
  movies survey table
*/

DROP TABLE IF EXISTS movies;

CREATE TABLE movies 
(
  IP_Address varchar(100) NOT NULL,
  Time_Spent int NOT NULL,
  Movie_Frequency varchar(100) NULL,
  Movie_1 int NULL,
  Movie_2 int NULL,
  Movie_3 int NULL,
  Movie_4 int NULL,
  Movie_5 int NULL,
  Movie_6 int NULL
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Survey_responses.csv'
INTO TABLE movies
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
(IP_Address, Time_Spent,@Movie_Frequency, @Movie_1, @Movie_2, @Movie_3, @Movie_4, @Movie_5, @Movie_6)
SET Movie_Frequency = if(@Movie_Frequency = '',"NA",@Movie_Frequency),
Movie_1 = if(@Movie_1 = '',0,@Movie_1),
Movie_2 = if(@Movie_2 = '',0,@Movie_2),
Movie_3 = if(@Movie_3 = '',0,@Movie_3),
Movie_4 = if(@Movie_4 = '',0,@Movie_4),
Movie_5 = if(@Movie_5 = '',0,@Movie_5),
Movie_6 = if(@Movie_6 = '',0,@Movie_6)
;

select * from movies;



/*
  movie_title table
*/

DROP TABLE IF EXISTS movie_title;
CREATE TABLE movie_title 
(
  Movie_Index varchar(100) NOT NULL,
  Movie_name varchar(100) NOT NULL
);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\movie_title.csv'
INTO TABLE movie_title
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(Movie_Index, Movie_name)
;

select * from movie_title;

/*
  imdb_rating table
*/

DROP TABLE IF EXISTS imdb_rating;
CREATE TABLE imdb_rating 
(
`Uniq Id` varchar(100) NULL,
`Crawl Timestamp` varchar(100) NULL,
Pageurl varchar(100) NULL,
Title varchar(100) NULL,
Genres varchar(100) NULL,
`Release Date` varchar(100) NULL,
`Movie Rating` varchar(100) NULL,
`Review Rating` int NULL,
`Movie Run Time` varchar(100) NULL,
Plot varchar(100) NULL,
Cast varchar(100) NULL,
Language varchar(100) NULL,
`Filming Locations` varchar(100) NULL,
Budget varchar(100) NULL,
Collection varchar(100) NULL,
`Collection Date` varchar(100) NULL

);

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\imdb_rating.csv'
ignore INTO TABLE imdb_rating
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
(`Uniq Id`,	`Crawl Timestamp`,	Pageurl,	Title,	Genres,	`Release Date`,	`Movie Rating`,	`Review Rating`,	`Movie Run Time`,	Plot,	Cast,	Language,	`Filming Locations`,	Budget,	Collection,	`Collection Date`)
;

select * from imdb_rating;

