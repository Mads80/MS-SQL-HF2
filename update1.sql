 ---Biblioteket---


--Tabel med vores lånere/brugere--
CREATE TABLE Låner ( 
LånerID int IDENTITY (1,1) PRIMARY KEY, 
LånerFornavn varchar(55) NOT NULL, 
LånerEfternavn varchar(55) NOT NULL, 
LånerAdresse varchar(55) NOT NULL, 
LånerTelefonnummer int NOT NULL, 
LånerPostnummer int NOT NULL, 
LånerTilmeldingsdato varchar(55) NOT NULL, 
); 


--Indsætter data i tabellen Låner--
INSERT INTO Låner 
(LånerFornavn, LånerEfternavn, LånerAdresse, LånerTelefonnummer, LånerPostnummer, LånerTilmeldingsdato) 
VALUES 

('Mark','Pedersen','Skovmærkevej 2','66666666','5000','18-05-2020'), 
('Mads','Finseth','Søndre Havnevej 60','60706070','5000','13-11-2019'), 
('Jacob','Vilhelmsen','Hækkehusvej 43','41224472','5000','13-11-2001'),
('Paul','Newman','Hvenetved 88','90765531','5000','13-11-2001'),
('Gitte','Heino','Ruegyden 16','90907788','5000','13-11-2001') 
;


--Bøger--
CREATE TABLE Bog ( 
BogID int IDENTITY (1,1) PRIMARY KEY, 
BogNavn varchar(55) NOT NULL, 
BogForfatter varchar(55) NOT NULL,
); 


--Indsætter data i tabellen Bog--
INSERT INTO Bog VALUES ('Skjult','Cara Hunter') 
INSERT INTO Bog VALUES ('Skjult','Cara Hunter') 
INSERT INTO Bog VALUES ('Skjult','Cara Hunter') 
INSERT INTO Bog VALUES ('Den tavse enke','Sara Blædel') 
INSERT INTO Bog VALUES ('Ulvesommer','Hans Rosenfeldt') 
INSERT INTO Bog VALUES ('Ulvesommer','Hans Rosenfeldt') 
INSERT INTO Bog VALUES ('Fandens Forår','Niels Krause-Kjær') 
INSERT INTO Bog VALUES ('Ferrari','Peter Nygaard') 
INSERT INTO Bog VALUES ('Ferrari','Peter Nygaard') 
INSERT INTO Bog VALUES ('Ferrari','Peter Nygaard') 
INSERT INTO Bog VALUES ('Det gyldne bur','Camilla Läckberg')   
INSERT INTO Bog VALUES ('Det gyldne bur','Camilla Läckberg')
INSERT INTO Bog VALUES ('Det gyldne bur','Camilla Läckberg')
INSERT INTO Bog VALUES ('KNIV','Jo Nesbø') 
INSERT INTO Bog VALUES ('KNIV','Jo Nesbø') 
INSERT INTO Bog VALUES ('KNIV','Jo Nesbø')  
INSERT INTO Bog VALUES ('Hviskende lig','Dennis Jürgensen') 
INSERT INTO Bog VALUES ('Hviskende lig','Dennis Jürgensen') 
INSERT INTO Bog VALUES ('Hviskende lig','Dennis Jürgensen') 


--Udlån af bøger-- 
--CREATE TABLE Udlån (
--BogID int FOREIGN KEY REFERENCES Bog(BogID),
--UdlånTilgængelighed int 
--); 

--INSERT INTO Udlån--
--('BogID','UdlånTilgængelighed') 
--VALUES 
--('5','0') 
--;
 
--Returnering af bøger--
--CREATE TABLE Retur ( 
--	BogID int FOREIGN KEY REFERENCES Bog(BogID) 
--); 


--Procedure for data til tabel-- 
CREATE PROCEDURE LånerData

@LånerFornavn varchar (20),
@LånerEfternavn varchar (20),
@LånerAdresse varchar (20),
@LånerTelefonnummer int,
@LånerPostnummer int, 
@LånerTilmeldingsdato varchar(20)
as
INSERT INTO Låner (LånerFornavn, LånerEfternavn, LånerAdresse, LånerTelefonnummer, LånerPostnummer, LånerTilmeldingsdato) 

Values (@LånerFornavn, @LånerEfternavn, @LånerAdresse, @LånerTelefonnummer, @LånerPostnummer, @LånerTilmeldingsdato) 
Go
--Indsæt en ny låner--
Exec LånerData 'Mads', 'Finseth', 'Skibhusvej 2', '88888888', '5000', '05-01-2021'


--Opretter procedure til at finde bruger ved hjælp af lånerID (virker)
Create Procedure FindLåner
@LånerID int 
AS
Select * From Låner 
Where LånerID = @LånerID 
go
--Søg efter låner--
Exec FindLåner '4'


--CREATE DB BACKUP--
BACKUP DATABASE Biblioteket 
TO DISK = 'C:\Biblioteket.bak';

 
--BACKUP DB PROCEDURE--
CREATE PROCEDURE BackupDB 
AS
BACKUP DATABASE Biblioteket 
TO DISK = 'C:\Biblioteket.bak'; 
EXEC BackupDB;
