
drop database if exists farmaciaamica;

create database farmaciaamica;
use farmaciaamica;
create table Cliente(

 Nome varchar(15) not null,
    Cognome varchar(15) not null,
    Email varchar(30) primary key,
    Pass varchar(15) not null,
 DataNascita date not null,
    Cap int(5) not null,
    Civico int(4) not null,
    Via varchar(25) not null,
    Citta varchar(10) not null,
    Provincia varchar(2) not null
);
create table Prodotti(
NomeProdotto varchar(20) primary key,
Descrizione varchar(30) not null,
    Prezzo double not null,
    Foto text(1000) not null

);

create table Acquista(
Email varchar(30) not null,
NomeProdotto varchar(20) not null,
    Foreign key(Email) references Cliente(Email) on update cascade,
    Foreign key(NomeProdotto) references Prodotti(NomeProdotto) on update cascade
);

/*Cliente*/
   INSERT INTO Cliente (Nome, Cognome, Email, Pass, DataNascita, Cap, Civico, Via, Citta, Provincia)
   VALUES ('Alessandro', 'Criscuolo','alecriscuolo@gmail.com', 'password', 07/08/2000, 8000, 20, 'Via Roma', 'Milano', 'MI');
   INSERT INTO Cliente (Nome, Cognome, Email, Pass, DataNascita, Cap, Civico, Via, Citta, Provincia)
   VALUES ('Marco', 'Avagliano','marcus@gmail.com', 'password', 07/08/2000, 7000, 30, 'Via Milano', 'Roma', 'RO');
   
/*Prodotti*/

 Insert into Prodotti(NomeProdotto, Descrizione, Prezzo, Foto)
    Values('Oki', 'Antinfiammatorio', '10', 'http://infonotizie.eu/wp-content/uploads/2016/01/Schermata-2015-11-28-alle-08.55.03.png');
    Insert into Prodotti(NomeProdotto, Descrizione, Prezzo, Foto)
    Values('Tachipirina', 'Paracetamolo', '5', 'http://www.pharmamedix.com/img/formeFarmaceutiche/tachipirina_compresse_1000.jpg');
    Insert into Prodotti(NomeProdotto, Descrizione, Prezzo, Foto)
    Values('Zerinol', 'Antipiretico', '12', 'http://www.lafarmaciaduemadonne.it/files/2015/02/23/zerinolflu.jpeg');
    Insert into Prodotti(NomeProdotto, Descrizione, Prezzo, Foto)
    Values('Benagol', 'Antisettico', '15', 'http://www.saninforma.it/immagini/190004778.png');
    Insert into Prodotti(NomeProdotto, Descrizione, Prezzo, Foto)
    Values('MomentRosa', 'Analgesico', '20', 'http://www.momendol.it/media/1264/momentrosa_bustine_12_big.jpg');
    Insert into Prodotti(NomeProdotto, Descrizione, Prezzo, Foto)
    Values('Lucen', 'Analgesico', '20', 'http://www.my-personaltrainer.it/thumbs/700x700/images/farmaci/Lucen.jpg');
/*Acquista*/
 Insert into Acquista(Email, NomeProdotto)
    Values ('alecriscuolo@gmail.com', 'Oki');
    Insert into Acquista(Email, NomeProdotto)
    Values ('marcus@gmail.com', 'MomentRosa');
    Insert into Acquista(Email, NomeProdotto)
    Values ('alecriscuolo@gmail.com', 'Benagol');
    Insert into Acquista(Email, NomeProdotto)
    Values ('marcus@gmail.it', 'Zerinol');
}
