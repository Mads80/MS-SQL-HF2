# :books: Biblioteket

### :blue_book: Dokumentation for ER-diagram/planlægning af case.

Vi har valgt at oprette 4 tabeller, hvor 3 af dem har forbindelse til hinanden. Den sidste tabel står for sig selv som og den viser kommende udgivelse af bøger.

:student: Låner som vi har valgt at kalde vores første tabel, indeholder alt information omkring lånerne på Biblioteket.
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

Dernest har vi en tabel som hedder Udlån.
```sql
CREATE TABLE Udlån (
UdlånTilgængelighed int NOT NULL,
BogID int FOREIGN KEY REFERENCES Bog(BogID),
LånerID INT FOREIGN KEY REFERENCES Låner(LånerID)
);
```

Tabellen Udlån tager fat i Låner tabellen og den sidste tabel som vi har kaldt Bog.
```sql
CREATE TABLE Bog ( 
BogID int IDENTITY (1,1) PRIMARY KEY, 
BogNavn varchar(55) NOT NULL, 
BogForfatter varchar(55) NOT NULL,
); 
```



Tabellen Bog giver information om hvilken bog og hvem der har lånt den. I bog tabellen er alt information om bøger i bibloteket. 
Som sidst nævte tabel har vi KommendeUdgivelser, som kan vise alle kommende bøger, med navn, forfatter, udgivelses dato og hvor mange antal der er bestilt hjem af bogen. 

![Entity–relationship model](Erdiagram02.png)
