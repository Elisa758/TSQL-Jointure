--CREATE DATABASE MartienRelation;
USE MartienRelation;

CREATE TABLE Continent(
idContinent INT PRIMARY KEY IDENTITY(1,1),
nameContinent VARCHAR(50)
);

CREATE TABLE Base(
idBase INT PRIMARY KEY IDENTITY(1,1),
nameBase VARCHAR(50)
);

CREATE TABLE Terrien(
idTerrien INT PRIMARY KEY IDENTITY(1,1),
nameTerrien VARCHAR(20),
continent_id INT NOT NULL,
CONSTRAINT fk_continentRef FOREIGN KEY (continent_id) 
REFERENCES Continent(idContinent),
);

CREATE TABLE Martien(
idMartien INT PRIMARY KEY IDENTITY(1,1),
nameMartien VARCHAR(20),
superieur_id INT NOT NULL,
terrien_id INT NOT NULL,
base_id INT NOT NULL,
CONSTRAINT fk_terrienRef FOREIGN KEY (terrien_id) 
REFERENCES Terrien(idTerrien),
CONSTRAINT fk_baseRef FOREIGN KEY (base_id) 
REFERENCES Base(idBase),
CONSTRAINT fk_supRef FOREIGN KEY (superieur_id) 
REFERENCES Martien(idMartien)
);

INSERT INTO Continent (nameContinent)
VALUES ('Arctique'),
('Afrique'),
('Europe');

INSERT INTO Base(nameBase)
VALUES ('Cratere'),
('New Town'),
('Olympus');

INSERT INTO Terrien(nameTerrien,continent_id)
VALUES ('Hans', 3),
('Kristoff', 1),
('Ursula',1);

SELECT * FROM Base;
SELECT * FROM Terrien;
SELECT * FROM Continent;

INSERT INTO Martien(nameMartien, superieur_id, terrien_id, base_id)
VALUES('Empereur',1, 3, 3),
('Kahl',1,2,3),
('Nyx', 2,1,1);

SELECT * FROM Martien;

SELECT m.nameMartien, m.superieur_id,t.nameTerrien, m.base_id, b.nameBase, t.continent_id, c.nameContinent
FROM Martien AS m
INNER JOIN Terrien AS t ON m.terrien_id =t.idTerrien
INNER JOIN Base AS b ON m.base_id=b.idBase
INNER JOIN Continent AS c ON t.continent_id=c.idContinent;
