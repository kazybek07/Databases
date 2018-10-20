/* Delete the tables if they already exist */
drop table if exists Movie;
drop table if exists Reviewer;
drop table if exists Rating;
CREATE DATABASE lab6;
/* Create the schema for our tables */
create table Movie(mID int, title text, year int, director text);
create table Reviewer(rID int, name text);
create table Rating(rID int, mID int, stars int, ratingDate date);
ALTER TABLE Movie
    ADD PRIMARY KEY (mID);--1

ALTER TABLE Movie
    ADD UNIQUE (title,year);--2
ALTER TABLE Reviewer
    ADD PRIMARY KEY(rID);--3
ALTER TABLE Rating
    ADD UNIQUE (rID,MID,ratingDate);--4
ALTER TABLE Reviewer
    ADD CONSTRAINT check_name CHECK (name IS NOT NULL);--5
ALTER TABLE Rating
    ADD CONSTRAINT check_stars CHECK (stars IS NOT NULL);--6
ALTER TABLE Movie
    ADD CONSTRAINT year_after CHECK(year>1900);--7
ALTER TABLE Rating
    ADD CONSTRAINT stars_in CHECK(stars IN (1,2,3,4,5));--8
ALTER TABLE Rating
    ADD CONSTRAINT date_after CHECK(EXTRACT(YEAR FROM ratingDate)>2000);--9

SELECT * from pg_constraint;

UPDATE Movie SET mID=mID+1;--error11
INSERT into Movie VAlUES(109,'Titanic',1997,'JC');--error12
INSERT INTO Reviewer VALUES (201, 'Ted Codd');--error13
UPDATE Rating set rID=205,mID=104;--error14
INSERT INTO Reviewer VALUES(209,NULL);--error15
UPDATE Rating set stars=NULL where RID=208;--error16
UPDATE Movie set year=year-40;--error17
UPDATE Rating SET stars=stars+1;--error18
INSERT INTO Rating VALUES(201,101,1,'1999-01-01');--error19
--error20 and error 21 are related with 10th constraint
INSERT INTO Movie VAlues(109,'Titanic',2001, NULL);--done22
UPDATE Rating SET mID=109;--done23
--done24 is related with 10th constraint
UPDATE Rating set stars=stars-1;--done25
ALTER TABLE Rating
    ADD FOREIGN KEY(rID) REFERENCES Reviewer(rID) ON UPDATE CASCADE ON DELETE SET NULL;--26
ALTER TABLE Rating
    ADD FOREIGN KEY(mID) REFERENCES Movie(mID)ON DELETE CASCADE ;--26
INSERT INTO Rating VALUES(209,109,3,'2001-01-01');--error27
UPDATE RATING set rID=209 where rid=208;--error28
UPDATE Rating set mID=mID+1;--error29
UPDATE Movie SET mId=109 WHERE mID=108;--error30
UPDATE Movie SET mID=110 WHERE mID=105;--done31
UPDATE Reviewer set rId=rId+10;--done32
DELETE FROM Reviewer where rid>215;--done33
DELETE FROM Movie where mID<105;--done34
SELECT sum(rID) FROM Rating WHERE rID is not nUll;--check35
SELECT count(*) From rating WHERE rID IS NULL;--check35
SELECT * from Rating;
