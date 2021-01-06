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
('Jacob','Vilhelmsen','Hækkehusvej 43','41224472','5000','12-05-2001'),
('Paul','Newman','Hvenetved 88','90765531','5000','30-12-1998'),
('Gitte','Heino','Ruegyden 16','90907788','5000','17-04-2011') 
;

--Procedure for data til tabel-- 
CREATE PROCEDURE LånerData

@LånerFornavn varchar(55),
@LånerEfternavn varchar(55),
@LånerAdresse varchar(55),
@LånerTelefonnummer int,
@LånerPostnummer int, 
@LånerTilmeldingsdato varchar(55)
AS
INSERT INTO Låner (LånerFornavn, LånerEfternavn, LånerAdresse, LånerTelefonnummer, LånerPostnummer, LånerTilmeldingsdato) 

Values (@LånerFornavn, @LånerEfternavn, @LånerAdresse, @LånerTelefonnummer, @LånerPostnummer, @LånerTilmeldingsdato) 
GO
--Indsæt en ny låner--
Exec LånerData 'Jørgen', 'Jørgensen', 'Skibhusvej 2', '88888888', '5000', '14-11-2001'
Exec LånerData 'Trine', 'Trunten', 'Damhusgården 420', '69696969', '5000', '25-05-1991'


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


CREATE TABLE Udlån (
UdlånTilgængelighed int NOT NULL,
BogID int FOREIGN KEY REFERENCES Bog(BogID),
); 

INSERT INTO Udlån
VALUES ('0','14');

--Returnering af bøger--
--CREATE TABLE Retur ( 
--	BogID int FOREIGN KEY REFERENCES Bog(BogID) 
--); 


--Opretter procedure til at finde bruger ved hjælp af LånerID
Create Procedure FindLånerID
@LånerID int 
AS
Select * From Låner 
Where LånerID = @LånerID 
go
--Søg efter låner--
Exec FindLånerID '4'

--Opretter procedure til at finde bruger ved hjælp af LånerFornavn
Create Procedure FindLånerNavn
@LånerFornavn varchar(55)
AS
Select * From Låner 
Where LånerFornavn = @LånerFornavn 
go
--Søg efter låner--
Exec FindLånerNavn 'Mark'


--CREATE DB BACKUP
--Find folderen "C:\backup", højre-klick på den og vælg "Properties", uncheck "Read-Only".
BACKUP DATABASE Biblioteket 
TO DISK = 'C:\backup\Biblioteket.bak';

 
--BACKUP DB PROCEDURE
--Find folderen "C:\backup", højre-klick på den og vælg "Properties", uncheck "Read-Only".
CREATE PROCEDURE BackupDB 
AS
BACKUP DATABASE Biblioteket 
TO DISK = 'C:\backup\Biblioteket2.bak';
--Backup DB
EXEC BackupDB;
