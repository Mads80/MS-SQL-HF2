 
 
 ---Biblioteket---



/*-----------------------------------------------------------------------------------------------------------------------------
Lånere
------------------------------------------------------------------------------------------------------------------------------*/


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

--Procedure for at indsætte data i tabellen Låner-- 
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


/*-----------------------------------------------------------------------------------------------------------------------------
Bøger
------------------------------------------------------------------------------------------------------------------------------*/


--Opretter tabellen Bog--
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

--Opretter tabellen KommendeUdgivelser
CREATE TABLE KommendeUdgivelser  (
KommendeUdgivelserID int IDENTITY (1,1) PRIMARY KEY,
UdgivelsesNavn varchar (55) NOT NULL,
UdgivelsesForfatter varchar (55) NOT NULL,
UdgivelsesDato varchar (55) NOT NULL,
UdgivelsesAntal int
);

--Stored Procedure til at tilføje kommende udgivelser
Create procedure TilføjUdgivelser
@UdgivelsesNavn varchar (55),
@UdgivelsesForfatter varchar(55),
@UdgivelsesDato varchar(55),
@UdgivelsesAntal int
AS
INSERT INTO KommendeUdgivelser (UdgivelsesNavn, UdgivelsesForfatter, UdgivelsesDato, UdgivelsesAntal)

Values (@UdgivelsesNavn, @UdgivelsesForfatter, @UdgivelsesDato, @UdgivelsesAntal)
GO

--Insæt en kommende bog--
Exec TilføjUdgivelser 'Det kolde guld', 'Cilla Börjlind', '05-02-2021', '5'
Exec TilføjUdgivelser '1794', 'Niklas Natt och Dag', '12-12-2022', '2'
Exec TilføjUdgivelser 'Lars Kjædegaard', 'Løgn i din hals', '05-02-2021', '4'
Exec TilføjUdgivelser 'Ni liv', 'Emelie Schepp', '04-09-2023', '1'

--Se kommende udgvielser
SELECT UdgivelsesNavn, UdgivelsesDato
FROM KommendeUdgivelser
Order by UdgivelsesNavn


/*-----------------------------------------------------------------------------------------------------------------------------
Udlån
------------------------------------------------------------------------------------------------------------------------------*/


--Opretter tabellen Udlån--
CREATE TABLE Udlån (
UdlånTilgængelighed int NOT NULL,
BogID int FOREIGN KEY REFERENCES Bog(BogID),
LånerID INT FOREIGN KEY REFERENCES Låner(LånerID)
); 

--Indsætter data i tabellen Udlån--
--2 betyder at bogen er udlånt--
--1 betyder at bogen er på lager--
INSERT INTO Udlån VALUES ('2','1','2')
INSERT INTO Udlån VALUES ('2','10','1')
INSERT INTO Udlån VALUES ('2','11','3')
INSERT INTO Udlån VALUES ('2','6','5')
INSERT INTO Udlån VALUES ('2','8','3')
INSERT INTO Udlån VALUES ('2','3','2')
INSERT INTO Udlån VALUES ('2','15','3')
INSERT INTO Udlån VALUES ('2','2','1')
INSERT INTO Udlån VALUES ('2','14','3')
INSERT INTO Udlån VALUES ('1','7','4')
INSERT INTO Udlån VALUES ('1','7','4')
INSERT INTO Udlån VALUES ('1','7','4')
INSERT INTO Udlån VALUES ('2','7','3')
INSERT INTO Udlån VALUES ('2','7','3')
INSERT INTO Udlån VALUES ('2','7','7')
INSERT INTO Udlån VALUES ('2','7','7')
INSERT INTO Udlån VALUES ('2','7','1')
INSERT INTO Udlån VALUES ('2','7','3')
INSERT INTO Udlån VALUES ('2','7','1')

--Når en bog kommer ud/ind kan nedenstående tabel update køres for at opdatere status. Husk også at ændre korrekte BogID--
UPDATE Udlån
SET UdlånTilgængelighed = 1
WHERE BogID = 1;

--Man kan også opdatere på baggrund af lånerID (hvis en låner kommer og aflevere alle bøger vedkomne har lånt)--
UPDATE Udlån
SET UdlånTilgængelighed = 1
WHERE LånerID = 3;

--Se hvilke bøger der er udlånt--
Create Procedure BogUdlån
AS
--Start procedure
Begin
Select * from  Udlån
Where UdlånTilgængelighed = 2
End
Exec BogUdlån
Select @@ROWCOUNT

--Se hvilke bøger der er på lager--
Create Procedure BogPåLager
AS
--Start procedure
Begin
Select * from  Udlån
Where UdlånTilgængelighed = 1
End
Exec BogPåLager
Select @@ROWCOUNT


/*-----------------------------------------------------------------------------------------------------------------------------
Søg i lånere
------------------------------------------------------------------------------------------------------------------------------*/


--Find bruger ved hjælp af LånerID
Create Procedure FindLånerID
@LånerID int 
AS
Select * From Låner 
Where LånerID = @LånerID 
go
--Søg efter låner--
Exec FindLånerID '4'

--Find bruger ved hjælp af LånerFornavn
Create Procedure FindLånerNavn
@LånerFornavn varchar(55)
AS
Select * From Låner 
Where LånerFornavn = @LånerFornavn 
go
--Søg efter låner--
Exec FindLånerNavn 'Mark'


/*-----------------------------------------------------------------------------------------------------------------------------
Backup
------------------------------------------------------------------------------------------------------------------------------*/


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


/*-----------------------------------------------------------------------------------------------------------------------------
Sletning af tabeller og databaser
------------------------------------------------------------------------------------------------------------------------------*/


--Slet database
DROP DATABASE Biblioteket;
--Slet tabel
DROP TABLE Låner;

--Slet database procedure
Create Procedure SletDB
AS
Drop database Biblioteket;

EXEC SletDB;

--Slet tabel procedure
Create Procedure SletTabel
AS
Drop table Bog;

EXEC SletTabel;
