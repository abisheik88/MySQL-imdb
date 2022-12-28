-- CREATING A TABLE FOR MOVIE
CREATE TABLE MOVIE
(
	ID INT PRIMARY KEY AUTO_INCREMENT,
	movieName VARCHAR(255) UNIQUE,
    movieRating FLOAT NOT NULL,
    movieReleaseDate DATE
);

-- INSERTING DATA INTO MOVIES TABLE
INSERT INTO MOVIE( movieName, movieRating, movieReleaseDate)
VALUES
('Thuppaki', 8.0, '2012-11-13' ),
('Mersal', 7.5, '2017-10-24' ),
('RRR', 8.0, '2022-01-11' ),
('Bahubali: The Beginning', 8.0, '2015-07-08' );

SELECT * FROM MOVIE;

-- CREATING A TABLE FOR MEDIA
CREATE TABLE MEDIA
(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    mediaFileName VARCHAR(1024) NOT NULL,
	mediaType VARCHAR(8) NOT NULL,
    movieID INT,
	CONSTRAINT fk_mveid FOREIGN KEY(movieID) REFERENCES MOVIE(ID)
);

-- INSERTING DATA INTO MEDIA TABLE
INSERT INTO MEDIA( mediaFileName, mediaType, movieID)
VALUES
('MersalSongOne','mp4',2),
('BahubaliPhoto','jpeg',4),
('RRRSongtwo','mp3',3),
('ThuppakiBGM','mp3',1),
('BahubaliSongThree','mp4',4),
('MersalSongThree','mp4',2),
('RRRBgm','mp3',3);

SELECT * FROM MEDIA;

-- CREATING A TABLE FOR GENRES
CREATE TABLE GENRES
(
	genre VARCHAR(64) NOT NULL,
    movieID INT,
    CONSTRAINT fk_mveid_genre FOREIGN KEY(movieID) REFERENCES MOVIE(ID)
);

-- INSERTING DATA INTO GENRES TABLE
INSERT INTO GENRES(genre,movieID)
VALUES
('Action', 1),
('Suspense', 1),
('fantasy',4),
('history',3),
('fiction',3),
('social',2);

SELECT * FROM GENRES;

-- CREATING A TABLE FOR USERS
CREATE TABLE USERS
(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    userName VARCHAR(64),
    userAge TINYINT,
    userGender VARCHAR(64)
);

-- INSERTING DATA INTO USERS TABLE
INSERT INTO USERS(userName,userAge,userGender)
VALUES
('Satish',23, 'Male'),
('Mithun',26, 'Male'),
('Ganesh',32, 'Male'),
('Kala',30, 'Female');

SELECT * FROM USERS;

-- CREATING A TABLE FOR REVIEWS
CREATE TABLE REVIEWS
(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    review VARCHAR(64) NOT NULL,
    movieID	INT,
    CONSTRAINT fk_mveid_review FOREIGN KEY(movieID) REFERENCES MOVIE(ID),
    userID INT,
    CONSTRAINT fk_usrid_review FOREIGN KEY(userID) REFERENCES USERS(ID)
);

-- INSERTING DATA INTO REVIEWS TABLE
INSERT INTO REVIEWS(review,movieID,userID)
VALUES 
('good',4,1),
('average',3,3),
('super',3,1),
('awesome',2,2),
('not good',2,3),
('super',2,4);

SELECT * FROM REVIEWS;

-- CREATING A TABLE FOR ARTIST
CREATE TABLE ARTISTS
(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    artistName VARCHAR(64) NOT NULL,
    artistAge TINYINT,
    artistGender VARCHAR(64)
);

-- INSERTING DATA INTO ARTISTS TABLE
INSERT INTO ARTISTS(artistName,artistAge,artistGender)
VALUES
('Vijay',47,'Male'),
('Prabhas',40,'Male'),
('NTR',35,'Male'),
('Anushka',38,'Female'),
('Kajal',33,'Female');

SELECT * FROM ARTISTS;

-- CREATING A TABLE FOR roles
CREATE TABLE ROLES
(
	ID INT PRIMARY KEY AUTO_INCREMENT,
    role VARCHAR(64) NOT NULL,
    movieID	INT,
    CONSTRAINT fk_mveid_roles FOREIGN KEY(movieID) REFERENCES MOVIE(ID),
    artistID INT,
    CONSTRAINT fk_artstid_review FOREIGN KEY(artistID) REFERENCES ARTISTS(ID)
);

-- INSERTING DATA INTO ROLES TABLE

INSERT INTO ROLES(role,movieID,artistID)
VALUES
('doctor',2,1),
('DI Agent',1,1),
('King',4,2),
('tribal',3,3),
('queen',4,3),
('boxer',1,4),
('friend',3,3);

SELECT * FROM ROLES