 

--Biblioteket 

 

Tabeller: 

 

--Brugere: 

CREATE TABLE L�ner ( 

L�nerID int IDENTITY (1,1) PRIMARY KEY, 

L�nerFornavn varchar(55) NOT NULL, 

L�nerEfternavn varchar(55) NOT NULL, 

L�nerAdresse varchar(55) NOT NULL, 

L�nerTelefonnummer int NOT NULL, 

L�nerPostnummer int NOT NULL, 

L�nerTilmeldingsdato varchar(55) NOT NULL, 

); 

 

--Inds�tter data i tabellen �L�ner�. 

INSERT INTO L�ner 

(L�nerFornavn, L�nerEfternavn, L�nerAdresse, L�nerTelefonnummer, L�nerPostnummer, L�nerTilmeldingsdato) 

VALUES 

('Mark','Pedersen','Skovm�rkevej 2','66666666','5000','18-05-2020'), 
('Mads','Finseth','S�ndre Havnevej 60','60706070','5000','13-11-2019'), 
('Jacob','Vilhelmsen','H�kkehusvej 43','41224472','5000','13-11-2001'),
('Paul','Newman','Hvenetved 88','90765531','5000','13-11-2001'),
('Gitte','Heino','Ruegyden 16','90907788','5000','13-11-2001') 
;

 

--B�ger: -- 

CREATE TABLE Bog ( 

BogID int IDENTITY (1,1) PRIMARY KEY, 

BogNavn varchar(55) NOT NULL, 

BogForfatter varchar(55) NOT NULL, 

BogUdl�n int NOT NULL 

); 

 

--Inds�tter data i tabellen �Bog�. 

INSERT INTO Bog VALUES ('Skjult','Cara Hunter','1') 

INSERT INTO Bog VALUES ('Skjult','Cara Hunter','1') 

INSERT INTO Bog VALUES ('Skjult','Cara Hunter','1') 

INSERT INTO Bog VALUES ('Den tavse enke','Sara Bl�del','0') 

INSERT INTO Bog VALUES ('Ulvesommer','Hans Rosenfeldt','0') 

INSERT INTO Bog VALUES ('Ulvesommer','Hans Rosenfeldt','0') 

INSERT INTO Bog VALUES ('Fandens For�r','Niels Krause-Kj�r','1') 

INSERT INTO Bog VALUES ('Ferrari','Peter Nygaard','0') 

INSERT INTO Bog VALUES ('Ferrari','Peter Nygaard','1') 

INSERT INTO Bog VALUES ('Ferrari','Peter Nygaard','1') 

INSERT INTO Bog VALUES ('Det gyldne bur','Camilla L�ckberg','1')   

INSERT INTO Bog VALUES ('Det gyldne bur','Camilla L�ckberg','0')

INSERT INTO Bog VALUES ('Det gyldne bur','Camilla L�ckberg','1')

INSERT INTO Bog VALUES ('KNIV','Jo Nesb�','0') 

INSERT INTO Bog VALUES ('KNIV','Jo Nesb�','1') 

INSERT INTO Bog VALUES ('KNIV','Jo Nesb�','1')  

INSERT INTO Bog VALUES ('Hviskende lig','Dennis J�rgensen','1') 

INSERT INTO Bog VALUES ('Hviskende lig','Dennis J�rgensen','0') 

INSERT INTO Bog VALUES ('Hviskende lig','Dennis J�rgensen','0') 

 

 

 

 

 

 

 

 

--Udl�n af b�ger: -- 

CREATE TABLE Udl�n (

BogID int FOREIGN KEY REFERENCES Bog(BogID) ,

Udl�nTilg�ngelighed int 

); 

 

INSERT INTO Udl�n 

('BogID','Udl�nTilg�ngelighed') 

VALUES 

('5','0') 

; 

 

--Returnering af b�ger: 

CREATE TABLE Retur ( 

BogID int FOREIGN KEY REFERENCES Bog(BogID) 

 

); 

 

--Procedure for data til tabel -- 

Create procedure L�nerData   

@L�nerFornavn varchar (20) ,

@L�nerEfternavn varchar (20) ,

@L�nerAdresse varchar (20) ,

@L�nerTelefonnummer int  ,

@L�nerPostnummer int , 

@L�nerTilmeldingsdato varchar(20), 

@L�nerUdl�n int

as

INSERT INTO L�ner (L�nerFornavn, L�nerEfternavn, L�nerAdresse, L�nerTelefonnummer, L�nerPostnummer, L�nerTilmeldingsdato, L�nerUdl�n) 

Values (@L�nerFornavn, @L�nerEfternavn, @L�nerAdresse, @L�nerTelefonnummer, @L�nerPostnummer, @L�nerTilmeldingsdato, @L�nerUdl�n) 

Go 

 

Exec L�nerData 'Mads', 'Finseth', 'Skibhusvej 2', '88888888', '5000', '5-01-2021','Harry potter og kaninknepperen'

 

--Opretter procedure til at finde bruger ved hj�lp af l�nerID 

Create Procedure Find_l�ner 

@L�nerID int 

AS 

Select * From L�ner 

Where L�nerID = @L�nerID 

 

 

 

 

--CREATE DB BACKUP 

BACKUP DATABASE Sportsvognklub 

TO DISK = 'C:\Biblioteket.bak'; 

 

--BACKUP DB PROCEDURE 

CREATE PROCEDURE BackupDB 

AS 

BACKUP DATABASE Sportsvognklub 

TO DISK = 'C:\Biblioteket.bak'; 

  

EXEC BackupDB; 