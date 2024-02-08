CREATE DATABASE SQL_PRACTICE;
USE SQL_PRACTICE;

CREATE TABLE employees (
    employee_id INT,
    last_name VARCHAR(255),
    first_name VARCHAR(255),
    title VARCHAR(255),
    reports_to INT,
    levels VARCHAR(2),
    birthdate DATE,
    hire_date DATE,
    address VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    postal_code VARCHAR(10),
    phone VARCHAR(20),
    fax VARCHAR(20),
    email VARCHAR(255)
);

INSERT INTO employees (employee_id, last_name, first_name, title, reports_to, levels, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email)
VALUES
(1, 'Adams', 'Andrew', 'General Manager', 9, 'L6', '1962-02-18', '2016-08-14', '11120 Jasper Ave NW', 'Edmonton', 'AB', 'Canada', 'T5K 2N1', '+1 (780) 428-9482', '+1 (780) 428-3457', 'andrew@chinookcorp.com'),
(2, 'Edwards', 'Nancy', 'Sales Manager', 1, 'L4', '1958-12-08', '2016-05-01', '825 8 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 2T3', '+1 (403) 262-3443', '+1 (403) 262-3322', 'nancy@chinookcorp.com'),
(3, 'Peacock', 'Jane', 'Sales Support Agent', 2, 'L1', '1973-08-29', '2017-04-01', '1111 6 Ave SW', 'Calgary', 'AB', 'Canada', 'T2P 5M5', '+1 (403) 262-3443', '+1 (403) 262-6712', 'jane@chinookcorp.com'),
(4, 'Park', 'Margaret', 'Sales Support Agent', 2, 'L1', '1947-09-19', '2017-05-03', '683 10 Street SW', 'Calgary', 'AB', 'Canada', 'T2P 5G3', '+1 (403) 263-4423', '+1 (403) 263-4289', 'margaret@chinookcorp.com'),
(5, 'Johnson', 'Steve', 'Sales Support Agent', 2, 'L1', '1965-03-03', '2017-10-17', '7727B 41 Ave', 'Calgary', 'AB', 'Canada', 'T3B 1Y7', '1 (780) 836-9987', '1 (780) 836-9543', 'steve@chinookcorp.com'),
(6, 'Mitchell', 'Michael', 'IT Manager', 1, 'L3', '1973-07-01', '2016-10-17', '5827 Bowness Road NW', 'Calgary', 'AB', 'Canada', 'T3B 0C5', '+1 (403) 246-9887', '+1 (403) 246-9899', 'michael@chinookcorp.com'),
(7, 'King', 'Robert', 'IT Staff', 6, 'L2', '1970-05-29', '2017-01-02', '590 Columbia Boulevard West', 'Lethbridge', 'AB', 'Canada', 'T1K 5N8', '+1 (403) 456-9986', '+1 (403) 456-8485', 'robert@chinookcorp.com'),
(8, 'Callahan', 'Laura', 'IT Staff', 6, 'L2', '1968-01-09', '2017-03-04', '923 7 ST NW', 'Lethbridge', 'AB', 'Canada', 'T1H 1Y8', '+1 (403) 467-3351', '+1 (403) 467-8772', 'laura@chinookcorp.com'),
(9, 'Madan', 'Mohan', 'Senior General Manager', NULL, 'L7', '1961-01-26', '2016-01-14', '1008 Vrinda Ave MT', 'Edmonton', 'AB', 'Canada', 'T5K 2N1', '+1 (780) 428-9482', '+1 (780) 428-3457', 'madan.mohan@chinookcorp.com');


CREATE TABLE customer (
	customer_id DECIMAL(38, 0) NOT NULL, 
	first_name VARCHAR(9) NOT NULL, 
	last_name VARCHAR(12) NOT NULL, 
	company VARCHAR(48) NOT NULL, 
	address VARCHAR(40) NOT NULL, 
	city VARCHAR(19) NOT NULL, 
	state VARCHAR(6), 
	country VARCHAR(14) NOT NULL, 
	postal_code VARCHAR(10), 
	phone VARCHAR(19), 
	fax VARCHAR(18), 
	email VARCHAR(29) NOT NULL, 
	support_rep_id DECIMAL(38, 0) NOT NULL
);

LOAD DATA INFILE
'F:/Practice SQL/customer.csv'
into table customer
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines TERMINATED by '\n'
IGNORE 1 ROWS;

select count(*) from customer;
SELECT COMPANY FROM CUSTOMER;

CREATE TABLE invoice (
	invoice_id DECIMAL(38, 0) NOT NULL, 
	customer_id DECIMAL(38, 0) NOT NULL, 
	invoice_date TIMESTAMP NULL, 
	billing_address VARCHAR(40) NOT NULL, 
	billing_city VARCHAR(19) NOT NULL, 
	billing_state VARCHAR(6), 
	billing_country VARCHAR(14) NOT NULL, 
	billing_postal_code VARCHAR(10), 
	total DECIMAL(38, 16) NOT NULL
);

LOAD DATA INFILE
'F:/Practice SQL/invoice.csv'
into table invoice
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines TERMINATED by '\n'
IGNORE 1 ROWS;

select count(*) from invoice;

CREATE TABLE invoice_line (
	invoice_line_id DECIMAL(38, 0) NOT NULL, 
	invoice_id DECIMAL(38, 0) NOT NULL, 
	track_id DECIMAL(38, 0) NOT NULL, 
	unit_price DECIMAL(38, 2) NOT NULL, 
	quantity BOOL NOT NULL
);

LOAD DATA INFILE
'F:/Practice SQL/invoice_line.csv'
into table invoice_line
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines TERMINATED by '\n'
IGNORE 1 ROWS;

CREATE TABLE track (
	track_id DECIMAL(38, 0) NOT NULL, 
	name VARCHAR(123) NOT NULL, 
	album_id DECIMAL(38, 0) NOT NULL, 
	media_type_id DECIMAL(38, 0) NOT NULL, 
	genre_id DECIMAL(38, 0) NOT NULL, 
	composer VARCHAR(188), 
	milliseconds DECIMAL(38, 0) NOT NULL, 
	bytes DECIMAL(38, 0) NOT NULL, 
	unit_price DECIMAL(38, 2) NOT NULL
);

LOAD DATA INFILE
'F:/Practice SQL/track.csv'
into table track
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines TERMINATED by '\n'
IGNORE 1 ROWS;

select count(*) from track;
select * from track;

CREATE TABLE playlist_track (
	playlist_id DECIMAL(38, 0) NOT NULL, 
	track_id DECIMAL(38, 0) NOT NULL
);
LOAD DATA INFILE
'F:/Practice SQL/playlist_track.csv'
into table playlist_track
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines TERMINATED by '\n'
IGNORE 1 ROWS;

select count(*) from playlist_track;

CREATE TABLE playlist (
	playlist_id DECIMAL(38, 0) NOT NULL, 
	name VARCHAR(26) NOT NULL
);
LOAD DATA INFILE
'F:/Practice SQL/playlist.csv'
into table playlist
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines TERMINATED by '\n'
IGNORE 1 ROWS;

CREATE TABLE media_type (
	media_type_id DECIMAL(38, 0) NOT NULL, 
	name VARCHAR(27) NOT NULL
);

LOAD DATA INFILE
'F:/Practice SQL/media_type.csv'
into table media_type
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines TERMINATED by '\n'
IGNORE 1 ROWS;

CREATE TABLE album (
	album_id DECIMAL(38, 0) NOT NULL, 
	title VARCHAR(95) NOT NULL, 
	artist_id DECIMAL(38, 0) NOT NULL
);

LOAD DATA INFILE
'F:/Practice SQL/album.csv'
into table album
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines TERMINATED by '\n'
IGNORE 1 ROWS;

select count(*) from album;

/* CREATE TABLE artist (
    artist_id INT ,
    name text
);
LOAD DATA INFILE 
'F:/Practice SQL/artist.csv'
INTO TABLE artist
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; */

CREATE TABLE artist(
	artist_id INTEGER  NOT NULL,
	name VARCHAR(85) NOT NULL
);
INSERT INTO artist(artist_id,name) VALUES (1,'AC/DC'),(2,'Accept'),(3,'Aerosmith'),(4,'Alanis Morissette'),
(5,'Alice In Chains'),(6,'Antônio Carlos Jobim'),(7,'Apocalyptica'),(8,'Audioslave'),(9,'BackBeat'),
(10,'Billy Cobham'),(11,'Black Label Society'),(12,'Black Sabbath'),(13,'Body Count'),(14,'Bruce Dickinson'),
(15,'Buddy Guy'),(16,'Caetano Veloso'),(17,'Chico Buarque'),(18,'Chico Science & Nação Zumbi'),(19,'Cidade Negra'),
(20,'Cláudio Zoli'),(21,'Various Artists'),(22,'Led Zeppelin'), (23,'Frank Zappa & Captain Beefheart'),(24,'Marcos Valle'),
(25,'Milton Nascimento & Bebeto'),(26,'Azymuth'),(27,'Gilberto Gil'),(28,'João Gilberto'),(29,'Bebel Gilberto'),
(30,'Jorge Vercilo'),(31,'Baby Consuelo'),(32,'Ney Matogrosso'), (33,'Luiz Melodia'),(34,'Nando Reis'),(35,'Pedro Luís & A Parede'),
(36,'O Rappa'),(37,'Ed Motta'),(38,'Banda Black Rio'),(39,'Fernanda Porto'),(40,'Os Cariocas'),(41,'Elis Regina'),
(42,'Milton Nascimento'),(43,'A Cor Do Som'),(44,'Kid Abelha'),(45,'Sandra De Sá'),(46,'Jorge Ben'),(47,'Hermeto Pascoal'),
(48,'Barão Vermelho'),(49,'Edson, DJ Marky & DJ Patife Featuring Fernanda Porto'),(50,'Metallica'),(51,'Queen'),
(52,'Kiss'),(53,'Spyro Gyra'),(54,'Green Day'),(55,'David Coverdale'),(56,'Gonzaguinha'),(57,'Os Mutantes'),
(58,'Deep Purple'),(59,'Santana'),(60,'Santana Feat. Dave Matthews'),(61,'Santana Feat. Everlast'),(62,'Santana Feat. Rob Thomas'),
(63,'Santana Feat. Lauryn Hill & Cee-Lo'),(64,'Santana Feat. The Project G&B'),(65,'Santana Feat. Maná'),(66,'Santana Feat. Eagle-Eye Cherry'),
(67,'Santana Feat. Eric Clapton'),(68,'Miles Davis'),(69,'Gene Krupa'),(70,'Toquinho & Vinícius'),(71,'Vinícius De Moraes & Baden Powell'),
(72,'Vinícius De Moraes'),(73,'Vinícius E Qurteto Em Cy'),(74,'Vinícius E Odette Lara'),(75,'Vinicius, Toquinho & Quarteto Em Cy'),
(76,'Creedence Clearwater Revival'),(77,'Cássia Eller'),(78,'Def Leppard'), (79,'Dennis Chambers'),(80,'Djavan'),
(81,'Eric Clapton'),(82,'Faith No More'),(83,'Falamansa'),(84,'Foo Fighters'),(85,'Frank Sinatra'),(86,'Funk Como Le Gusta'),
(87,'Godsmack'),(88,'Guns N'' Roses'),(89,'Incognito'),(90,'Iron Maiden'),(91,'James Brown'),(92,'Jamiroquai'),(93,'JET'),
(94,'Jimi Hendrix'),(95,'Joe Satriani'),(96,'Jota Quest'),(97,'João Suplicy'),(98,'Judas Priest'),(99,'Legião Urbana'),(100,'Lenny Kravitz'),
(101,'Lulu Santos'),(102,'Marillion'),(103,'Marisa Monte'),(104,'Marvin Gaye'),(105,'Men At Work'),(106,'Motörhead'),
(107,'Motörhead & Girlschool'),(108,'Mônica Marianno'),(109,'Mötley Crüe'),(110,'Nirvana'),(111,'O Terço'),(112,'Olodum'),
(113,'Os Paralamas Do Sucesso'),(114,'Ozzy Osbourne'),(115,'Page & Plant'),(116,'Passengers'),(117,'Paul D''Ianno'),(118,'Pearl Jam'),
(119,'Peter Tosh'),(120,'Pink Floyd'),(121,'Planet Hemp'),(122,'R.E.M. Feat. Kate Pearson'),(123,'R.E.M. Feat. KRS-One'),(124,'R.E.M.'),
(125,'Raimundos'),(126,'Raul Seixas'),(127,'Red Hot Chili Peppers'),(128,'Rush'),(129,'Simply Red'),(130,'Skank'),(131,'Smashing Pumpkins'),
(132,'Soundgarden'),(133,'Stevie Ray Vaughan & Double Trouble'),(134,'Stone Temple Pilots'),(135,'System Of A Down'),
(136,'Terry Bozzio, Tony Levin & Steve Stevens'),(137,'The Black Crowes'),(138,'The Clash'),(139,'The Cult'),
(140,'The Doors'),(141,'The Police'),(142,'The Rolling Stones'),(143,'The Tea Party'),(144,'The Who'),(145,'Tim Maia'),
(146,'Titãs'),(147,'Battlestar Galactica'),(148,'Heroes'),(149,'Lost'),(150,'U2'),(151,'UB40'),(152,'Van Halen'),(153,'Velvet Revolver'),
(154,'Whitesnake'),(155,'Zeca Pagodinho'),(156,'The Office'),(157,'Dread Zeppelin'),(158,'Battlestar Galactica (Classic)'),
(159,'Aquaman'),(160,'Christina Aguilera featuring BigElf'),(161,'Aerosmith & Sierra Leone''s Refugee Allstars'),
(162,'Los Lonely Boys'),(163,'Corinne Bailey Rae'),(164,'Dhani Harrison & Jakob Dylan'),(165,'Jackson Browne'),
(166,'Avril Lavigne'),(167,'Big & Rich'),(168,'Youssou N''Dour'),(169,'Black Eyed Peas'),(170,'Jack Johnson'),(171,'Ben Harper'),(172,'Snow Patrol'),
(173,'Matisyahu'),(174,'The Postal Service'),(175,'Jaguares'),(176,'The Flaming Lips'),(177,'Jack''s Mannequin & Mick Fleetwood'),
(178,'Regina Spektor'),(179,'Scorpions'),(180,'House Of Pain'),(181,'Xis'),(182,'Nega Gizza'),(183,'Gustavo & Andres Veiga & Salazar'),
(184,'Rodox'),(185,'Charlie Brown Jr.'),(186,'Pedro Luís E A Parede'),(187,'Los Hermanos'),(188,'Mundo Livre S/A'),
(189,'Otto'),(190,'Instituto'),(191,'Nação Zumbi'),(192,'DJ Dolores & Orchestra Santa Massa'),
(193,'Seu Jorge'),(194,'Sabotage E Instituto'),(195,'Stereo Maracana'),(196,'Cake'),(197,'Aisha Duo'),(198,'Habib Koité and Bamada'),
(199,'Karsh Kale'),(200,'The Posies'),(201,'Luciana Souza/Romero Lubambo'),(202,'Aaron Goldberg'),(203,'Nicolaus Esterhazy Sinfonia'),
(204,'Temple of the Dog'),(205,'Chris Cornell'),(206,'Alberto Turco & Nova Schola Gregoriana'),
(207,'Richard Marlow & The Choir of Trinity College, Cambridge'),(208,'English Concert & Trevor Pinnock'),
(209,'Anne-Sophie Mutter, Herbert Von Karajan & Wiener Philharmoniker'),(210,'Hilary Hahn, Jeffrey Kahane, Los Angeles Chamber Orchestra & Margaret Batjer'),
(211,'Wilhelm Kempff'),(212,'Yo-Yo Ma'),(213,'Scholars Baroque Ensemble'),(214,'Academy of St. Martin in the Fields & Sir Neville Marriner'),
(215,'Academy of St. Martin in the Fields Chamber Ensemble & Sir Neville Marriner'),(216,'Berliner Philharmoniker, Claudio Abbado & Sabine Meyer'),
(217,'Royal Philharmonic Orchestra & Sir Thomas Beecham'),(218,'Orchestre Révolutionnaire et Romantique & John Eliot Gardiner'),
(219,'Britten Sinfonia, Ivor Bolton & Lesley Garrett'),(220,'Chicago Symphony Chorus, Chicago Symphony Orchestra & Sir Georg Solti'),
(221,'Sir Georg Solti & Wiener Philharmoniker'),(222,'Academy of St. Martin in the Fields, John Birch, Sir Neville Marriner & Sylvia McNair'),
(223,'London Symphony Orchestra & Sir Charles Mackerras'),(224,'Barry Wordsworth & BBC Concert Orchestra'),
(225,'Herbert Von Karajan, Mirella Freni & Wiener Philharmoniker'),(226,'Eugene Ormandy'),
(227,'Luciano Pavarotti'),(228,'Leonard Bernstein & New York Philharmonic'),(229,'Boston Symphony Orchestra & Seiji Ozawa'),
(230,'Aaron Copland & London Symphony Orchestra'),(231,'Ton Koopman'),(232,'Sergei Prokofiev & Yuri Temirkanov'),
(233,'Chicago Symphony Orchestra & Fritz Reiner'),(234,'Orchestra of The Age of Enlightenment'),(235,'Emanuel Ax, Eugene Ormandy & Philadelphia Orchestra'),
(236,'James Levine'),(237,'Berliner Philharmoniker & Hans Rosbaud'),(238,'Maurizio Pollini'),
(239,'Academy of St. Martin in the Fields, Sir Neville Marriner & William Bennett'),(240,'Gustav Mahler'),
(241,'Felix Schmidt, London Symphony Orchestra & Rafael Frühbeck de Burgos'),(242,'Edo de Waart & San Francisco Symphony'),
(243,'Antal Doráti & London Symphony Orchestra'),(244,'Choir Of Westminster Abbey & Simon Preston'),(245,'Michael Tilson Thomas & San Francisco Symphony'),
(246,'Chor der Wiener Staatsoper, Herbert Von Karajan & Wiener Philharmoniker'),(247,'The King''s Singers'),(248,'Berliner Philharmoniker & Herbert Von Karajan'),
(249,'Sir Georg Solti, Sumi Jo & Wiener Philharmoniker'),(250,'Christopher O''Riley'),(251,'Fretwork'),(252,'Amy Winehouse'),
(253,'Calexico'),(254,'Otto Klemperer & Philharmonia Orchestra'),(255,'Yehudi Menuhin'),(256,'Philharmonia Orchestra & Sir Neville Marriner'),
(257,'Academy of St. Martin in the Fields, Sir Neville Marriner & Thurston Dart'),(258,'Les Arts Florissants & William Christie'),
(259,'The 12 Cellists of The Berlin Philharmonic'),(260,'Adrian Leaper & Doreen de Feis'),
(261,'Roger Norrington, London Classical Players'),(262,'Charles Dutoit & L''Orchestre Symphonique de Montréal'),
(263,'Equale Brass Ensemble, John Eliot Gardiner & Munich Monteverdi Orchestra and Choir'),(264,'Kent Nagano and Orchestre de l''Opéra de Lyon'),
(265,'Julian Bream'),(266,'Martin Roscoe'),(267,'Göteborgs Symfoniker & Neeme Järvi'),(268,'Itzhak Perlman'),
(269,'Michele Campanella'),(270,'Gerald Moore'),(271,'Mela Tenenbaum, Pro Musica Prague & Richard Kapp'),
(272,'Emerson String Quartet'),(273,'C. Monteverdi, Nigel Rogers - Chiaroscuro; London Baroque; London Cornett & Sackbu'),(274,'Nash Ensemble'),
(275,'Philip Glass Ensemble');

select count(*) from artist;

CREATE TABLE genre (
	genre_id DECIMAL(38, 0) NOT NULL, 
	name VARCHAR(18) NOT NULL
);

LOAD DATA INFILE
'F:/Practice SQL/genre.csv'
into table genre
FIELDS TERMINATED by ','
ENCLOSED by '"'
lines TERMINATED by '\n'
IGNORE 1 ROWS;

/*--------------------------------- SQL QUERY --------------------------------------*/

# 1. Who is the senior most employee based on job title? 

SELECT employee_id,first_name,last_name,title,levels
FROM employees
WHERE levels = (
    SELECT MAX(levels)
    FROM employees
);

# 2. Which countries have the most Invoices?

SELECT billing_country,
       COUNT(*) AS invoice_count
FROM invoice
GROUP BY billing_country
ORDER BY invoice_count DESC;

# 3. What are top 3 values of total invoice?

SELECT invoice_id,total
FROM invoice
ORDER BY total DESC
LIMIT 3;

/* 4. Which city has the best customers? We would like to throw a promotional Music Festival in the 
city we made the most money. Write a query that returns one city that has the highest sum of 
invoice totals. Return both the city name & sum of all invoice totals */

SELECT billing_city,
       SUM(total) as total_amount
FROM invoice
GROUP BY billing_city
ORDER BY total_amount DESC;

select * from invoice
where billing_city = 'Edmonton';

SELECT billing_city,
       AVG(total) AS avg_amount_spent_per_customer
FROM invoice
GROUP BY billing_city
ORDER BY avg_amount_spent_per_customer DESC
LIMIT 1;

/* 5. Who is the best customer? The customer who has spent the most money will be declared the 
best customer. Write a query that returns the person who has spent the most money */

SELECT c.customer_id,c.first_name,c.last_name,
       AVG(i.total) AS avg_amount_spent_per_invoice
FROM invoice i
JOIN customer c ON i.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY avg_amount_spent_per_invoice DESC
LIMIT 1;

SELECT c.customer_id,c.first_name,c.last_name,
       SUM(i.total) AS total_amount_spent
FROM invoice i
JOIN customer c ON i.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_amount_spent DESC
LIMIT 1;

/* SELECT c.customer_id, SUM(total) AS total_spending
FROM invoice c 
JOIN invoice i  ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY total_spending DESC
LIMIT 1;*/

/* 1. Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A */

SELECT c.email,c.first_name,c.last_name,g.name AS genre
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN genre g ON t.genre_id = g.genre_id
WHERE UPPER(g.name) like '%ROCK%'
ORDER BY c.email ASC;

SELECT c.email,c.first_name,c.last_name,GROUP_CONCAT(g.name) AS genres
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN genre g ON t.genre_id = g.genre_id
WHERE UPPER(g.name) LIKE '%ROCK%'
GROUP BY c.email, c.first_name, c.last_name
ORDER BY c.email ASC;


/* 2. Let's invite the artists who have written the most rock music in our dataset. Write a query that 
returns the Artist name and total track count of the top 10 rock bands */

SELECT ar.name AS artist_name,COUNT(t.track_id) AS total_tracks
FROM artist ar
JOIN album al ON ar.artist_id = al.artist_id
JOIN track t ON al.album_id = t.album_id
JOIN genre g ON t.genre_id = g.genre_id
WHERE UPPER(g.name) LIKE '%ROCK%'
GROUP BY ar.name
ORDER BY total_tracks DESC
LIMIT 20;

SELECT COUNT(t.track_id) AS total_tracks FROM track t;

/* 3. Return all the track names that have a song length longer than the average song length. Return 
the Name and Milliseconds for each track. Order by the song length with the longest songs listed 
first */

SELECT name AS track_name, milliseconds
FROM track
WHERE milliseconds > (SELECT AVG(milliseconds) FROM track)
ORDER BY milliseconds DESC
limit 10;

SELECT name,milliseconds
FROM track
WHERE milliseconds > (SELECT AVG(milliseconds) FROM track)
order by 2 desc;

/* 1. Find how much amount spent by each customer on artists? Write a query to return customer 
name, artist name and total spent*/

SELECT cu.customer_id,cu.first_name, cu.last_name, a.name AS artist_name,
SUM(il.unit_price) AS total_spent
FROM invoice i
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN album al ON t.album_id = al.album_id
JOIN artist a ON al.artist_id = a.artist_id
JOIN customer cu ON i.customer_id = cu.customer_id
GROUP BY cu.customer_id, cu.first_name, cu.last_name, a.name
ORDER BY total_spent DESC;


/* 2. We want to find out the most popular music Genre for each country. We determine the most 
popular genre as the genre with the highest amount of purchases. Write a query that returns 
each country along with the top Genre. For countries where the maximum number of purchases 
is shared return all Genres */

SELECT c.country, MAX(g.name) AS top_genre
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
JOIN invoice_line il ON i.invoice_id = il.invoice_id
JOIN track t ON il.track_id = t.track_id
JOIN genre g ON t.genre_id = g.genre_id
GROUP BY c.country
ORDER BY c.country;
    
/* 3. Write a query that determines the customer that has spent the most on music for each 
country. Write a query that returns the country along with the top customer and how much they 
spent. For countries where the top amount spent is shared, provide all customers who spent this 
amount */

SELECT c.customer_id AS cust_id,c.first_name AS name_customer, c.last_name AS lastname_customer, 
i.billing_country AS country, MAX(t.total_som) AS max_som
FROM customer c
JOIN Invoice i ON c.customer_id = i.customer_id
JOIN (
    SELECT customer_id, billing_country, SUM(Total) AS total_som
    FROM Invoice
    GROUP BY customer_id, billing_country 
) AS t ON c.customer_id = t.customer_id AND i.billing_country = t.billing_country
GROUP BY c.customer_id, c.first_name, c.last_name, i.billing_country
ORDER BY max_som DESC;
