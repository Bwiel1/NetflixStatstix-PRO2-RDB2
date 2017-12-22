USE master
DROP DATABASE IF EXISTS NetflixStats;
CREATE DATABASE NetflixStats;
GO
USE NetflixStats
/* Parent tabel": Account*/
DROP TABLE IF EXISTS Account;
CREATE TABLE Account (
  AboNr int NOT NULL,
  Naam nvarchar(30) NOT NULL,
  Straat nvarchar(30) NOT NULL,
  Postcode nchar(6) NOT NULL,
  Stad nvarchar(30) NOT NULL,
  CONSTRAINT PK_Account PRIMARY KEY (AboNr)
	
);

INSERT INTO Account(AboNr, Naam, Straat, Postcode, Stad) VALUES
(1215426, 'Fam. van Raalte', 'Schopenhauerdijkje', '3991ML','Houten'),
(5602533, 'J. van Betlehem', 'Nietzschestraat', '8542BE','Breda'),
(5285824, 'F. de Kat', 'Kantlaan', '8542CD','Breda');

/* FK AboNr leidt af van parent account*/
DROP TABLE IF EXISTS Profiel;
CREATE TABLE Profiel (
  AboNr int NOT NULL,
  ProfielNaam nvarchar(30) NOT NULL,
  BirthDate date NOT NULL,
  CONSTRAINT PK_Profiel PRIMARY KEY (Profielnaam),
  		CONSTRAINT Profiel_FK 
			FOREIGN KEY (AboNr) REFERENCES Account(AboNr)
				ON UPDATE NO ACTION
				ON DELETE CASCADE
);

INSERT INTO Profiel(AboNr, ProfielNaam, BirthDate) VALUES
(1215426, 'Frank', '1968-01-25'),
(1215426, 'Madelief', '2001-08-19'),
(5602533, 'Petrus' , '1999-06-26'),
(5602533, 'Paulus' , '1999-06-26'),
(5285824, 'Fritz' , '1968-08-19'),
(5285824, 'Diana' , '1988-12-25');

/* FK AboNr leidt af van parent account*/
DROP TABLE IF EXISTS Bekeken;
CREATE TABLE Bekeken (
  AboNr int NOT NULL,
  ProfielNaam nvarchar(30) NOT NULL,
  Gezien int NOT NULL,
  PrecTage int NOT NULL CHECK (PrecTage <= 100), 
    CONSTRAINT PK_Bekeken PRIMARY KEY (Profielnaam, Gezien),
		CONSTRAINT Bekeken_FK 
			FOREIGN KEY (AboNr) REFERENCES Account(AboNr)
				ON UPDATE NO ACTION
				ON DELETE CASCADE
);

INSERT INTO Bekeken(AboNr, ProfielNaam, Gezien, PrecTage) VALUES
(1215426, 'Frank', '1001' , 100),
(1215426, 'Frank', '1002' , 100),
(1215426, 'Frank', '1003' , 78),
(1215426, 'Madelief', '1001', 100),
(1215426, 'Madelief', '1002', 60),
(1215426, 'Madelief', '3001', 91),
(1215426, 'Madelief', '2001', 100),
(1215426, 'Madelief', '2002', 100),
(1215426, 'Madelief', '2003', 100),
(1215426, 'Madelief', '2004', 22),
(5602533, 'Petrus' , '3001', 100),
(5602533, 'Petrus' , '3002', 100),
(5602533, 'Petrus' , '3010', 60),
(5602533, 'Petrus' , '8001', 100),
(5602533, 'Petrus' , '8002', 99),
(5602533, 'Paulus' , '3001', 100),
(5602533, 'Paulus' , '3002', 74),
(5602533, 'Paulus' , '3010', 60),
(5602533, 'Paulus' , '8001', 100),
(5602533, 'Paulus' , '2019', 10),
(5285824, 'Fritz' , '1001', 100),
(5285824, 'Fritz' , '1002', 100),
(5285824, 'Fritz' , '1010', 5),
(5285824, 'Diana' , '8002' , 100),
(5285824, 'Diana' , '1001' , 45);

DROP TABLE IF EXISTS Film;
CREATE TABLE Film (
  Id int NOT NULL,
  Titel nvarchar(35) NOT NULL,
  /*Je kunt dus zetten van 16 jaar of ouder*/
  LefInd nvarchar(30) NOT NULL,
  Taal nvarchar(30) NOT NULL,
  TijdsDuur nchar(5) NOT NULL,
  Genre nvarchar(25) NOT NULL,
  CONSTRAINT PK_Film PRIMARY KEY (Id)
  );

  INSERT INTO Film (Id, Titel, LefInd, Taal, TijdsDuur, Genre) VALUES
  (1010, 'The Abominable Bridge', '12', 'Engels' , '01:29', 'Detective'),
  (8001, 'The Life of Brian', '12 jaar en ouder', 'Engels' , '01:34', 'Humor'),
  (8002, 'Pulp Fiction', '16 jaar en ouder', 'Engels-Amerikaans' , '02:34', 'Misdaad'),
  (8004, 'Pruimebloesem', '18 jaar en ouder', 'Nederlands' , '01:20', 'Erotiek'),
  (8008, 'Reservoir Dogs', '16 jaar en ouder', 'Engels-Amerikaans' , '01:39', 'Misdaad'),
  (8010, 'The Good, the Bad and the Ugly ', '12 jaar en ouder', 'Engels-Amerikaans' , '02:41', 'Western'),
  (8011, 'Andy Warhols Dracula', '16 jaar en ouder', 'Engels-Amerikaans' , '01:43', 'Humor'),
  (8012, 'Ober', '6 jaar en ouder', 'Nederlands' , '01:37', 'Humor'),
  (8014, 'Der Untergang', '6 jaar en ouder', 'Duits' , '02:58', 'Oorlog'),
  (8016, 'De helaasheid der dingen', '12 jaar en ouder', 'Vlaams' , '01:48', 'Humor'),
  (8017, 'A Clockwork Orange', '16 jaar en ouder', 'Engels' , '02:07', 'SF');

/*parent Serie*/
DROP TABLE IF EXISTS Serie;
CREATE TABLE Serie (
  Serie nvarchar(30) NOT NULL,
  Seizoen nchar(6) NOT NULL,
  /*Je kunt dus zetten van 16 jaar of ouder*/
  Leeftijd nvarchar(30) NOT NULL,
  Taal nvarchar(30) NOT NULL,
  Genre nvarchar(30) NOT NULL,
  LijktOp nvarchar (25) NOT NULL,
  CONSTRAINT PK_Serie PRIMARY KEY (Serie)
);

INSERT INTO Serie (Serie, Seizoen, Leeftijd, Taal, Genre, LijktOp) VALUES
('Sherlock', 'S01E01', '12 jaar en ouder', 'Engels', 'Detective', 'Fargo' ),
('Breaking Bad', 'S01E01', '16 jaar en ouder', 'Engels-Amerikaans', 'Spanning', 'Fargo' ),
('Fargo', 'S01E01', '16 jaar en ouder', 'Engels-Amerikaans', 'Spanning', 'Breaking Bad' );

/* FK Serie leidt af van parent Serie*/
DROP TABLE IF EXISTS Aflevering;
CREATE TABLE Aflevering (
  Id int NOT NULL,
  Serie nvarchar(30) NOT NULL,  
  Seizoen nchar(6) NOT NULL,
  Titel nvarchar(40) NOT NULL,
  TijdsDuur nchar(5) NOT NULL,
  CONSTRAINT PK_Aflevering PRIMARY KEY (Id),
	CONSTRAINT Aflevering_FK 
	FOREIGN KEY (Serie) REFERENCES Serie(Serie)
		ON UPDATE CASCADE
		ON DELETE NO ACTION
);

INSERT INTO Aflevering (Id, Serie, Seizoen, Titel, TijdsDuur) VALUES
(1001,	'Sherlock',	'S01E01', 'A Study in Pink', '01:28'),
(1002,	'Sherlock',	'S01E02', 'The Blind Banker', '01:28'),
(1003,	'Sherlock',	'S01E03', 'The Great Game', '01:28'),
(1004,	'Sherlock',	'S02E01', 'A Scandal in Belgravia', '01:28'),
(1005,	'Sherlock',	'S02E02', 'The Hounds of Baskerville', '01:28'),
(1006,	'Sherlock',	'S02E03', 'The Reichenbach Fall', '01:28'),
(1007,	'Sherlock',	'S03E01', 'The Empty Hearse', '01:28'),
(1008,	'Sherlock',	'S03E02', 'The Sign of Three', '01:28'),
(1009,	'Sherlock',	'S03E03', 'His Last Vow', '01:28'),
(2000, 'Breaking Bad', 'S01E01', 'Pilot', '00:58'),
(2001, 'Breaking Bad', 'S01E02', 'Cats in the Bag...', '00:48'),
(2002, 'Breaking Bad', 'S01E03', '...And the Bags in the River', '00:48'),
(2003, 'Breaking Bad', 'S01E04', 'Cancer Man', '00:48'),
(2004, 'Breaking Bad', 'S01E05', 'Gray Matter', '00:48'),
(2005, 'Breaking Bad', 'S01E06', 'Crazy Handful of Nothing', '00:48'),
(2006, 'Breaking Bad', 'S01E07', 'A No-Rough-Stuff-Type Deal', '00:48'),
(2007, 'Breaking Bad', 'S01E01', 'Seven Thirty-Seven', '00:48'),
(2008, 'Breaking Bad', 'S02E02', 'Grilled', '00:48'),
(2009, 'Breaking Bad', 'S02E03', 'Bit by a Dead Bee', '00:48'),
(2010, 'Breaking Bad', 'S02E04', 'Down', '00:48'),
(2011, 'Breaking Bad', 'S02E05', 'Breakage', '00:48'),
(2012, 'Breaking Bad', 'S02E06', 'Peekaboo', '00:48'),
(2013, 'Breaking Bad', 'S02E07', 'Negro Y Azul', '00:48'),
(2014, 'Breaking Bad', 'S02E08', 'Better Call Saul', '00:48'),
(2015, 'Breaking Bad', 'S02E09', '4 Days Out', '00:48'),
(2016, 'Breaking Bad', 'S02E10', 'Over', '00:48'),
(2017, 'Breaking Bad', 'S02E11', 'Mandala', '00:48'),
(2018, 'Breaking Bad', 'S02E12', 'Phoenix', '00:48'),
(2019, 'Breaking Bad', 'S02E13', 'ABQ', '00:48'),
(3001, 'Fargo' , 'S01E01', 'The Crocodiles Dilemma', '01:08'),
(3002, 'Fargo' , 'S01E02', 'The Rooster Price', '01:08'),
(3003, 'Fargo' , 'S01E03', 'A Muddy Road', '01:08'),
(3004, 'Fargo' , 'S01E04', 'Eating the Blame', '01:08'),
(3005, 'Fargo' , 'S01E05', 'The Six Ungraspables', '01:08'),
(3006, 'Fargo' , 'S01E06', 'Buridans Ass', '01:08'),
(3007, 'Fargo' , 'S01E07', 'Who Shaves the Barber?', '01:08'),
(3008, 'Fargo' , 'S01E08', 'The Heap', '01:08'),
(3009, 'Fargo' , 'S01E09', 'A Fox, a Rabbit, and a Cabbage', '01:08'),
(3010, 'Fargo' , 'S01E10', 'Mortons Fork', '01:08'),
(3101, 'Fargo' , 'S02E01', 'Waiting for Dutch', '01:08'),
(3102, 'Fargo' , 'S02E02', 'Before the Law', '01:08'),
(3103, 'Fargo' , 'S02E03', 'The Myth of Sisyphus', '01:08'),
(3104, 'Fargo' , 'S02E04', 'The Gift of the Magi', '01:08'),
(3105, 'Fargo' , 'S02E05', 'Fear and Trembling', '01:08'),
(3106, 'Fargo' , 'S02E06', 'Rhinoceros', '01:08'),
(3107, 'Fargo' , 'S02E07', 'Did you do this? No, you did it!', '01:08'),
(3108, 'Fargo' , 'S02E08', 'Loplop', '01:08'),
(3109, 'Fargo' , 'S02E09', 'The Castle', '01:08'),
(3110, 'Fargo' , 'S02E10', 'Palindrome', '01:08');