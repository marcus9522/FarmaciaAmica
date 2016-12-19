
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
Email varchar(20) not null,
NomeProdotto varchar(20) not null,
    Foreign key(Email) references Cliente(Email) on update cascade,
    Foreign key(NomeProdotto) references Prodotti(NomeProdotto) on update cascade
);

/*Cliente*/
   INSERT INTO Cliente (Nome, Cognome, Email, Pass, DataNascita, Cap, Civico, Via, Citta, Provincia)
   VALUES ('Alessandro', 'Criscuolo',' alecriscuolo@gmail.com', 'password', 07/08/2000, 8000, 20, 'Via Roma', 'Milano', 'MI');
   INSERT INTO Cliente (Nome, Cognome, Email, Pass, DataNascita, Cap, Civico, Via, Citta, Provincia)
   VALUES ('Marco', 'Avagliano',' marcus@gmail.com', 'password', 07/08/2000, 7000, 30, 'Via Milano', 'Roma', 'RO');
   
/*Prodotti*/

 Insert into Prodotti(NomeProdotto, Descrizione, Prezzo, Foto)
    Values('Oki', 'Antinfiammatorio', '10', '{{\field{\*\fldinst{HYPERLINK http://infonotizie.eu/wp-content/uploads/2016/01/Schermata-2015-11-28-alle-08.55.03.png }}{\fldrslt{http://infonotizie.eu/wp-content/uploads/2016/01/Schermata-2015-11-28-alle-08.55.03.png\ul0\cf0}}}}\f0\fs22 ');
    Insert into Prodotti(NomeProdotto, Descrizione, Prezzo, Foto)\par
    Values('Tachipirina', 'Paracetamolo', '5', '{{\field{\*\fldinst{HYPERLINK http://www.pharmamedix.com/img/formeFarmaceutiche/tachipirina_compresse_1000.jpg }}{\fldrslt{http://www.pharmamedix.com/img/formeFarmaceutiche/tachipirina_compresse_1000.jpg\ul0\cf0}}}}\f0\fs22 ');
    Insert into Prodotti(NomeProdotto, Descrizione, Prezzo, Foto)\par
    Values('Zerinol', 'Antipiretico', '12', '{{\field{\*\fldinst{HYPERLINK http://www.lafarmaciaduemadonne.it/files/2015/02/23/zerinolflu.jpeg }}{\fldrslt{http://www.lafarmaciaduemadonne.it/files/2015/02/23/zerinolflu.jpeg\ul0\cf0}}}}\f0\fs22 ');
    Insert into Prodotti(NomeProdotto, Descrizione, Prezzo, Foto)\par
    Values('Benagol', 'Antisettico', '15', '{{\field{\*\fldinst{HYPERLINK http://www.pharmily.it/2579-thickbox_default/benagol-vitamina-c-past-arancia.jpg }}{\fldrslt{http://www.pharmily.it/2579-thickbox_default/benagol-vitamina-c-past-arancia.jpg\ul0\cf0}}}}\f0\fs22 ');
    Insert into Prodotti(NomeProdotto, Descrizione, Prezzo, Foto)\par
    Values('MomentRosa', 'Analgesico', '20', '{{\field{\*\fldinst{HYPERLINK http://www.momendol.it/media/1264/momentrosa_bustine_12_big.jpg }}{\fldrslt{http://www.momendol.it/media/1264/momentrosa_bustine_12_big.jpg\ul0\cf0}}}}\f0\fs22 ');
/*Acquista*/
 Insert into Acquista(Email, NomeProdotto)
    Values ('alecriscuolo@gmail.com', 'oki');
    Insert into Acquista(Email, NomeProdotto)
    Values ('marcus@gmail.com', 'MomentRosa');
    Insert into Acquista(Email, NomeProdotto)
    Values ('alecriscuolo@gmail.com', 'Benagol');
    Insert into Acquista(Email, NomeProdotto)
    Values ('marcus@gmail.it', 'Zerinol');
}
