# :books: Biblioteket

### :blue_book: Dokumentation for ER-diagram/planlægning af case.


I denne opgave har vi valgt at oprette 4 tabeller, hvor 3 af dem har forbindelse til hinanden. Den sidste tabel står for sig selv som og den viser kommende udgivelse af bøger.

:student: "Låner" som vi har valgt at kalde vores første tabel, indeholder al information omkring lånerne på Biblioteket.
```sql
CREATE TABLE Låner ( 
LånerID int IDENTITY (1,1) PRIMARY KEY, 
LånerFornavn varchar(55) NOT NULL, 
LånerEfternavn varchar(55) NOT NULL, 
LånerAdresse varchar(55) NOT NULL, 
LånerTelefonnummer int NOT NULL, 
LånerPostnummer int NOT NULL, 
LånerTilmeldingsdato varchar(55) NOT NULL, 
); 
```

:technologist: Dernest har vi en tabel som hedder "Udlån".
```sql
CREATE TABLE Udlån (
UdlånTilgængelighed int NOT NULL,
BogID int FOREIGN KEY REFERENCES Bog(BogID),
LånerID INT FOREIGN KEY REFERENCES Låner(LånerID)
);
```

:orange_book: Tabellen "Udlån" har forbindelse med "Låner" tabellen. "Bog" tabellen indeholder information omkring bøger.
```sql
CREATE TABLE Bog ( 
BogID int IDENTITY (1,1) PRIMARY KEY, 
BogNavn varchar(55) NOT NULL, 
BogForfatter varchar(55) NOT NULL,
); 
```

:notebook: Den sidste tabel vi har er "KommendeUdgivelser", som viser alle kommende bøger; med navn, forfatter, udgivelses dato og hvor mange antal der er bestilt hjem af bogen.
```sql
CREATE TABLE KommendeUdgivelser  (
KommendeUdgivelserID int IDENTITY (1,1) PRIMARY KEY,
UdgivelsesNavn varchar (55) NOT NULL,
UdgivelsesForfatter varchar (55) NOT NULL,
UdgivelsesDato varchar (55) NOT NULL,
UdgivelsesAntal int
);
```

Entity-Relationship-Diagram
![Entity–relationship model](images/Erdiagram02.png)
