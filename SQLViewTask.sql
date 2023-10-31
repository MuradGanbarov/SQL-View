CREATE DATABASE MusicData
USE MusicData

CREATE TABLE Users
(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL,
Surname VARCHAR(50) NOT NULL,
Username VARCHAR(50) NOT NULL,
Password VARCHAR(50) NOT NULL,
Gender CHAR(10) NOT NULL,
)

CREATE TABLE Artists
(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL,
Surname VARCHAR(50) DEFAULT 'XXX',
Birthday DATE,
Gender VARCHAR(10) NOT NULL,
)


CREATE TABLE Categories
(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL,
)

CREATE TABLE Musics
(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL,
Duration INT,
CategoryID INT REFERENCES Categories(Id),
ArtistID INT REFERENCES Artists(Id)
)

CREATE TABLE Playlist
(
MusicID INT FOREIGN KEY REFERENCES Musics(Id),
UserId INT FOREIGN KEY REFERENCES Users(Id)
)

INSERT INTO Users
VALUES
('Murad','Ganbarov','Murad2004','murad2004','Male'),
('Amin','Rzayev','Amin2004','amin2004','Male'),
('Rashad','Rufullayev','Rashad2004','rashad2004','Male')

INSERT INTO Artists(Name,Surname,Birthday,Gender)
VALUES
('Kurt','Cobain','02-20-1067','Male'),
('Nina','Simone','02-21-1933','Female'),
('Eric','Wright','09-07-1964','Male')

INSERT INTO Categories(Name)
VALUES
('Rock'),
('Jazz'),
('Rap')

INSERT INTO Musics
VALUES
('School', 200,1,1),
('Blackbird',300,2,2),
('Dopeman', 600,3,3)

INSERT INTO Playlist VALUES
(1,1),
(2,2),
(3,3)

CREATE VIEW MusicInfo
AS
SELECT M.Name AS 'Mahnin adi', M.Duration AS 'Mahninin uzunlughu',C.Name AS 'Kateqoriyanin adi',
CONCAT(A.Name,' ',A.Surname) AS'Ifadechi'
FROM Musics AS M
JOIN Categories AS C ON M.CategoryID = C.Id
JOIN Artists AS A ON M.ArtistID = A.Id

SELECT * FROM MusicInfo