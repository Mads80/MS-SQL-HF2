 

--Biblioteket 

 

Tabeller: 
 

--Brugere: 

CREATE TABLE Låner ( 
LånerID int IDENTITY (1,1) PRIMARY KEY, 
LånerFornavn varchar(55) NOT NULL, 
LånerEfternavn varchar(55) NOT NULL, 
LånerAdresse varchar(55) NOT NULL, 
LånerTelefonnummer int NOT NULL, 
LånerPostnummer int NOT NULL, 
LånerTilmeldingsdato varchar(55) NOT NULL, 
); 

 

--Indsætter data i tabellen “Låner”. 

INSERT INTO Låner 

(LånerFornavn, LånerEfternavn, LånerAdresse, LånerTelefonnummer, LånerPostnummer, LånerTilmeldingsdato) 

VALUES 

('Mark','Pedersen','Skovmærkevej 2','66666666','5000','18-05-2020'), 
('Mads','Finseth','Søndre Havnevej 60','60706070','5000','13-11-2019'), 
('Jacob','Vilhelmsen','Hækkehusvej 43','41224472','5000','13-11-2001'),
('Paul','Newman','Hvenetved 88','90765531','5000','13-11-2001'),
('Gitte','Heino','Ruegyden 16','90907788','5000','13-11-2001') 
;

 

--Bøger: -- 

CREATE TABLE Bog ( 
BogID int IDENTITY (1,1) PRIMARY KEY, 
BogNavn varchar(55) NOT NULL, 
BogForfatter varchar(55) NOT NULL, 
BogUdlån int NOT NULL 
); 

 

--Indsætter data i tabellen “Bog”. 

INSERT INTO Bog VALUES ('Skjult','Cara Hunter','1') 
INSERT INTO Bog VALUES ('Skjult','Cara Hunter','1') 
INSERT INTO Bog VALUES ('Skjult','Cara Hunter','1') 
INSERT INTO Bog VALUES ('Den tavse enke','Sara Blædel','0') 
INSERT INTO Bog VALUES ('Ulvesommer','Hans Rosenfeldt','0') 
INSERT INTO Bog VALUES ('Ulvesommer','Hans Rosenfeldt','0') 
INSERT INTO Bog VALUES ('Fandens Forår','Niels Krause-Kjær','1') 
INSERT INTO Bog VALUES ('Ferrari','Peter Nygaard','0') 
INSERT INTO Bog VALUES ('Ferrari','Peter Nygaard','1') 
INSERT INTO Bog VALUES ('Ferrari','Peter Nygaard','1') 
INSERT INTO Bog VALUES ('Det gyldne bur','Camilla Läckberg','1')   
INSERT INTO Bog VALUES ('Det gyldne bur','Camilla Läckberg','0')
INSERT INTO Bog VALUES ('Det gyldne bur','Camilla Läckberg','1')
INSERT INTO Bog VALUES ('KNIV','Jo Nesbø','0') 
INSERT INTO Bog VALUES ('KNIV','Jo Nesbø','1') 
INSERT INTO Bog VALUES ('KNIV','Jo Nesbø','1')  
INSERT INTO Bog VALUES ('Hviskende lig','Dennis Jürgensen','1') 
INSERT INTO Bog VALUES ('Hviskende lig','Dennis Jürgensen','0') 
INSERT INTO Bog VALUES ('Hviskende lig','Dennis Jürgensen','0') 


--Udlån af bøger: -- 

CREATE TABLE Udlån (

BogID int FOREIGN KEY REFERENCES Bog(BogID) ,

UdlånTilgængelighed int 

); 

 

INSERT INTO Udlån 

('BogID','UdlånTilgængelighed') 

VALUES 

('5','0') 

; 

 

--Returnering af bøger: 

CREATE TABLE Retur ( 
	BogID int FOREIGN KEY REFERENCES Bog(BogID) 
); 


--Procedure for data til tabel -- 
Create procedure LånerData

@LånerFornavn varchar (20) ,
@LånerEfternavn varchar (20) ,
@LånerAdresse varchar (20) ,
@LånerTelefonnummer int  ,
@LånerPostnummer int , 
@LånerTilmeldingsdato varchar(20), 
@LånerUdlån int

as

INSERT INTO Låner (LånerFornavn, LånerEfternavn, LånerAdresse, LånerTelefonnummer, LånerPostnummer, LånerTilmeldingsdato) 

Values (@LånerFornavn, @LånerEfternavn, @LånerAdresse, @LånerTelefonnummer, @LånerPostnummer, @LånerTilmeldingsdato) 

Go 

Exec LånerData 'Mads', 'Finseth', 'Skibhusvej 2', '88888888', '5000', '5-01-2021','Harry potter og kaninknepperen'



--Opretter procedure til at finde bruger ved hjælp af lånerID 

--Create Procedure Find_låner 

--@LånerID int 

--AS 

--Select * From Låner 

--Where LånerID = @LånerID 

 

 

 

 

--CREATE DB BACKUP
BACKUP DATABASE Sportsvognklub 
TO DISK = 'C:\Biblioteket.bak'; 

 

--BACKUP DB PROCEDURE 
CREATE PROCEDURE BackupDB 
AS
BACKUP DATABASE Sportsvognklub 
TO DISK = 'C:\Biblioteket.bak'; 
EXEC BackupDB;
