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
	Categoria	varchar(20) not null,
	Descrizione varchar(1000) not null,
    Prezzo double not null,
    Foto text(1000) not null

);

create table Acquista(
	Email varchar(30) not null,
	NomeProdotto varchar(20) not null,
    Foreign key(Email) references Cliente(Email) on update cascade on delete cascade,
    Foreign key(NomeProdotto) references Prodotti(NomeProdotto) on update cascade on delete cascade
);

/*Cliente*/
   INSERT INTO Cliente (Nome, Cognome, Email, Pass, DataNascita, Cap, Civico, Via, Citta, Provincia)
   VALUES ('Alessandro', 'Criscuolo','alecriscuolo@gmail.com', 'password', '2000-10-20', 8000, 20, 'Via Roma', 'Milano', 'MI');
   INSERT INTO Cliente (Nome, Cognome, Email, Pass, DataNascita, Cap, Civico, Via, Citta, Provincia)
   VALUES ('Marco', 'Avagliano','marcus@gmail.com', 'password', '2000-05-07', 7000, 30, 'Via Milano', 'Roma', 'RO');
   
/*Prodotti*/

 Insert into Prodotti(NomeProdotto, Categoria, Descrizione, Prezzo, Foto)
    Values('Oki', 'Antinfiammatorio', 'OKI è comunemente utilizzato nel trattamento degli stati dolorosi di origine infiammatoria sia su base reumatica che post-traumatica a carico dell apparato muscolo-scheletrico, odontoiatrico, respiratorio e urologico.', '10', 'http://infonotizie.eu/wp-content/uploads/2016/01/Schermata-2015-11-28-alle-08.55.03.png');
    Insert into Prodotti(NomeProdotto, Categoria, Descrizione, Prezzo, Foto)
    Values('Tachipirina', 'Paracetamolo', 'Tachipirina fa parte della categoria farmacoterapeutica degli altri analgesici ed antipiretici. Come antipiretico: trattamento sintomatico di affezioni febbrili quali l influenza, le malattie esantematiche, le affezioni acute del tratto respiratorio, ecc. Come analgesico: cefalee, nevralgie, mialgie ed altre manifestazioni dolorose di media entità, di varia origine.', '5', 'http://www.pharmamedix.com/img/formeFarmaceutiche/tachipirina_compresse_1000.jpg');
    Insert into Prodotti(NomeProdotto, Categoria, Descrizione, Prezzo, Foto)
    Values('Zerinol', 'Antipiretico', 'Zerinol è un analgesico (allevia il dolore) ed un antipiretico (riduce la febbre) che contiene i principi attivi paracetamolo e clorfenamina maleato.Zerinol si usa per il trattamento dei sintomi dell influenza e del raffreddore negli adulti.', '12', 'http://www.lafarmaciaduemadonne.it/files/2015/02/23/zerinolflu.jpeg');
    Insert into Prodotti(NomeProdotto, Categoria, Descrizione, Prezzo, Foto)
    Values('Benagol', 'Antisettico', 'BENAGOL contiene i principi attivi 2,4-diclorobenzil alcool, amilmetacresolo ed ha un attività antisettica (antibatterica) a livello del cavo orofaringeo, viene utilizzato per disinfettare la bocca e la gola con un effetto prolungato.', '15', 'http://www.saninforma.it/immagini/190004778.png');
    Insert into Prodotti(NomeProdotto, Categoria, Descrizione, Prezzo, Foto)
    Values('MomentRosa', 'Analgesico', 'Il Moment rosa è un farmaco analgesico-antinfiammatorio, cioè utile per combattere sia il dolore, sia l infiammazione. Si tratta di un granulato vendute in confezioni da 12 bustine che (fatti salvi eventuali adeguamenti del prezzo dell ultim ora) possono essere acquistate a un prezzo di 5,00 euro senza bisogno di ricetta medica. Si tratta, infatti, di un medicinale di automedicazione che può essere utilizzato per curare dei leggeri disturbi o problemi passeggeri.', '20', 'http://www.momendol.it/media/1264/momentrosa_bustine_12_big.jpg');
    Insert into Prodotti(NomeProdotto, Categoria, Descrizione, Prezzo, Foto)
    Values('Lucen', 'Analgesico', 'LUCEN ® è utile sia come supporto farmacologico per la prevenzione e guarigione delle ulcere gastriche e duodenali associate a terapia prolungata con farmaci antinfiammatori non steroidei, sia come approccio terapeutico al trattamento di tutti quelli stati morbosi associati ad iperacidità gastrica come malattia da reflusso gastroesofageo, esofagite erosiva, ulcere duodenali, ulcera gastrica e peptica, e sindrome di Zollinger-Ellison.', '20', 'http://www.my-personaltrainer.it/thumbs/700x700/images/farmaci/Lucen.jpg');
/*Acquista*/
 Insert into Acquista(Email, NomeProdotto)
    Values ('alecriscuolo@gmail.com', 'Oki');
    Insert into Acquista(Email, NomeProdotto)
    Values ('marcus@gmail.com', 'MomentRosa');
    Insert into Acquista(Email, NomeProdotto)
    Values ('alecriscuolo@gmail.com', 'Benagol');
    Insert into Acquista(Email, NomeProdotto)
    Values ('marcus@gmail.com', 'Zerinol');
