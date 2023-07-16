CREATE DATABASE project1;
USE project1;
 
CREATE TABLE Producer_Details
(
Prod_Id int primary key,
Prod_Name varchar(30),
Prod_Phone varchar(20)
) ;

#Inserting values into Producer_Details table
INSERT INTO Producer_Details VALUES(2301, 'Yash Rangineni', 9504751284),(2302, 'NarayanDas K Narang', 9504754576),(2303, 'Ram Mohan Rao', 9265751284),(2304, 'Rajesh Danda', 8264551284),(2305, 'Rasamayi Balakishan', 8974526315),(2306, 'K Rajashekar Reddy', 7856941256);
INSERT INTO Producer_Details VALUES(2307, 'Pradeep Yadav',9845726156),(2308, 'Mahesh',9007756156),(2309, 'Ananda Prasad V',9012030169),(2310, 'Salman Khan',80641026183),(2311, 'Abhishek Agarwal',8456279514),(2312, 'Jagannadh Puri',7845968574),(2314, 'Nagarjuna',7835419678),(2315, 'Sahu Garapati',6845726156),(2316, 'Bunny Vasu',8965741250),(2317, 'Shailaja Samudrala',6845726156),(2318, 'Ram Gopal Verma',9845726156);
SELECT*FROM Producer_Details;


CREATE TABLE Artist_Details
(
Art_Id int primary key,
Art_Name varchar(30),
Art_Gender varchar(10), 
Film_Id int,
FOREIGN KEY(Film_Id) References Films_Detail(Film_Id),
FOREIGN KEY(Art_Id) REFERENCES Films_Detail(Art_Id)
);

INSERT INTO Artist_Details VALUES(001, 'Chaitanya Madadi', 'Male',01),(002, 'Sudheer Babu', 'Male',02),(003, 'Sundeep Kishan', 'Male',08),(004, 'Jagapathi Babu', 'Male',04),(005, 'Nikhil siddhartha', 'Male',05),(006, 'Vijay Devarakonda', 'Male',11),(007, 'Nagarjuna', 'Male',12),(008, 'Divyansha Kushik', 'Female',13),(009, 'Gopichand T', 'Male',14),(010, 'Bithiri Sathi', 'Male',15),(011, 'Naina Ganguly', 'Female',16);
SELECT*FROM Artist_Details;

CREATE TABLE Films_Detail
(
Film_Id int primary key,
Film_Title varchar(30),
Film_Year date,
Film_Lang varchar(10),
Film_Description varchar(255),
Hit_FLop VARCHAR(5),
Prod_Id int,
Art_Id int,
FOREIGN KEY(Prod_Id) REFERENCES Producer_Details(Prod_Id),
FOREIGN KEY(Art_Id) REFERENCES Artist_Details(Art_Id)
);

INSERT INTO Films_Detail VALUES(01, 'Annapurna Photo Studio','2023/07/21', 'Telugu','Chanti leades a simple yet comfortbale life. He opens a photo studio and names it after his mother.',null, 2301,001),
(02, 'Mama Mascheendra','2023/07/21', 'Telugu','While Durga longs for a girlfriend, DJ avaoids girls. Then there is Parasuram who wants to kill these two.', null, 2302,002),
(03, 'Ooru Peru Bhairavakona','2023/01/26', 'Telugu','The film is inspired by Induan follore about a mythical village namee Bhairavakona', 'Flop', 2304,003),
(04, 'Rudrangi','2023/07/07', 'Telugu','the plot revolves around the childhood lovers, Mallesh and rudrangi, who find themselves entagled in a tripartite rivalry involving the lecherous feudal lord Bhim Rao and his wife Jwala bhai.','Flop', 2305,004),
(05, 'SPY','2023/06/29', 'Telugu','A desk-bound CIA analyst volunteers to go undercover to infiltrate the world of a deadly arms dealer, and prevent diabolical global disaster.','Hit', 2306,005),
(06, 'Mukachitram','2022/12/09', 'Telugu','A plastic surgeon life turns upside down after he replaces his wifes face o his ex-girlfriend.','Hit', 2307,001),
(07, 'V','2020/09/05', 'Telugu','In the film, a decorated police officer tries to hunt down a serial killer','Hit', 2309,002),
(08, 'Michael','2023/02/23', 'Telugu','In 1980s Michael is a gangster, who is mentored by the bombay_based crime boss Gurunath, and raised by his right-hand man Swamy.','Flop', 2303,003),
(09, 'Kisi ka bhai kisi ki jaan','2023/04/21', 'Hindi','Two younger siblings must wait to marry until their elder brother becomes attached, but hes ageing and still a bachelor.','Flop',2310,004),
(10, 'Kartikeya 2','2022/08/13', 'Telugu','While on trip to Dwarka wiht his family,Dr.Kartikeya gets embroiled in a dangerous search for an ancient anklet.','Hit', 2311,005),
(11, 'Liger','2022/08/25', 'Telugu','A bravehearted Liger works his way upto find his dream spot in the MMA world, but his life gets complicated when he crosses paths with Taniya.','Flop',2312,006),
(12, 'Bangaraju','2022/01/04', 'Telugu','A deceased couple reunite in heaven following their deaths.When they notice that their grandson has lost his way in life, they request permission to return to Earth and help him.','Hit', 2314,007),
(13, 'Majili','2019/04/05', 'Telugu','A former cricket player nursing his wounds of a failed relationship takes up the task of training his exlovers daughter.','Hit', 2315,008),
(14, 'Pakka Commercial','2022/07/01', 'Telugu','A judge, steps down as he fails to provide justice to a sexually harassed girl. His son, too becomes a lawyer but works wih criminals for quick gains.','Flop', 2316,009),
(15, 'Diksoochi','2019/04/05', 'Telugu','A TV journalist recieves a mysterious phone call and sets out to solve the mystery surrounding a tragic incident that happened in 1975.','flop',2317,010),
(16, 'Khatra','2022/12/09', 'Telugu','Rashmi and Nalini have had bad experiences with men aand in due course, end up falling passionately in love with each other. Togethr, they chalk out a plan to steal from Nalinis husband who is gangster.','Flop', 2318,011);

SELECT*FROM Films_Detail;

# films with producer
SELECT F1.Film_Title AS Film_Title, F2.Prod_Name AS Prod_Name FROM Films_Detail F1, Producer_Details F2
WHERE F1.Prod_Id=F2.Prod_Id;

#Films Released in same year between july to december
SELECT Film_Title, Film_Year FROM Films_Detail
GROUP BY Film_Year
HAVING Film_Year BETWEEN '2022/07/01' AND '2022/12/31';

# Artist's film
SELECT*FROM Artist_Details
INNER JOIN Films_Detail ON Films_Detail.Film_Id=Artist_Details.Film_Id;

#Films to be released
SELECT*FROM Films_Detail
WHERE Film_Year>'2023/07/15';

# Hit Films
SELECT*FROM Films_Detail
WHERE Hit_Flop='Hit';

#Movies of Particular hero	
SELECT*FROM Films_Detail
WHERE Art_Id=1;

#Films lot of flopped films
SELECT Film_Title, Film_Description FROM Films_Detail
Where Hit_Flop='Flop';

#Films released on same date
SELECT Film_Title, Film_Year FROM Films_Detail
WHERE Film_Year='2023/07/21'; 

#Telugu Films which are released in the same year
SELECT Film_Id,Film_Title FROM Films_Detail
GROUP BY Film_Year
HAVING Film_Year BETWEEN '2022/12/31' AND '2023/07/31';

#Film of Particular Producer
SELECT*FROM Producer_Details
LEFT JOIN Films_Detail ON Producer_Details.Prod_Id=Films_Detail.Prod_Id
WHERE Prod_Name='Salman Khan';

#films of artist
SELECT*FROM Artist_Details
LEFT JOIN Films_Detail ON Artist_Details.Art_Id=Films_Detail.Art_Id
WHERE Art_Name='Nikhil siddhartha';

# reviews based on IMDb rating (OUT OF 10)
CREATE TABLE Review_Film
(
Stars float,
Film_Id int,
FOREIGN KEY(Film_Id) REFERENCES Films_Detail(Film_Id)
);

INSERT INTO Review_Film VALUES(NULL, 01), (NULL, 02), (5, 03), (7.6, 04),(8.7, 05),(6.6, 06),(6.8, 07),(5, 08),(5.2, 09),(8, 10),(2.3, 11),(5.6, 12),(7.2, 13),(4.2, 14),(6, 15),(7.6, 16);
SELECT*FROM Review_Film;

#Review of Films
SELECT*FROM Films_Detail
LEFT JOIN Review_Film 
ON Review_Film.Film_Id=Films_Detail.Film_Id;

CREATE TABLE Genres
(
Gen_Id int, 
Gen_Title varchar(30),
Film_Id int,
FOREIGN KEY(Film_Id) REFERENCES Films_Detail(Film_Id)
);

INSERT INTO Genres VALUES(101, 'Triller', 01),(102, 'Drama', 02),(103, 'Supernatural Fantasy Thriller', 03),(104, 'Adventure', 04),(105, 'Adventure Mystery', 05),(106, 'Romantic Thriller', 06),(107, 'Action Thriller', 07),(108, 'Action Thriller', 08),(109, 'Romantic Action Drama', 09),(110, ' Adventure Action Mystery ', 10),(111, 'Sports Action', 11),(112, 'Supernatural Drama', 12),(113, 'Romantic Drama', 13),(114, 'Legal Action Comedy', 14),(115, 'Devotional Crime Thriller', 15),(116, 'Romantic Crime', 16);

SELECT*FROM Genres;

#Genres of films
SELECT*FROM Genres 
RIGHT JOIN Films_Detail ON Genres.Film_Id=Films_Detail.Film_Id;

#same genre films
SELECT*FROM  Genres
JOIN Films_Detail ON Genres.Film_Id=Films_Detail.Film_Id
WHERE Gen_Title='Action Thriller';

#Genre and Producers of Films
SELECT*FROM Films_Detail
LEFT JOIN Genre
ON Genre.Film_Id=Films_Detail.Film_Id
LEFT JOIN Producer_Details
ON Producer_Details.Prod_Id=Films_Detail.Prod_Id;


CREATE TABLE Casting_Data
(
Art_Id int,
Film_Id int, 
Part varchar(10),
FOREIGN KEY(Art_Id) REFERENCES Artist_Data(Art_Id),
FOREIGN KEY(Film_Id) REFERENCES Films_Detail(Film_Id)
);
SELECT*FROM Casting_Data;

INSERT INTO Casting_Data VALUES(001, 01, 'Actor'),(002, 02, 'Actor'),(003, 03, 'Actor'),(004,04,'Villian'),(005,05,'Actor'),(006,11,'Actor'),(007,12,'Guest'),(008,08, 'Actress'),(009, 14, 'Actor'),(010, 15, 'Actor'),(011, 16, 'Actress'),(004,09,'Guest'),(001,06,'Actor'),(005, 10, 'Actor'),(002, 07, 'Guest');
SELECT*FROM Casting_Data;

#Part of Artist in Films
SELECT*FROM Artist
LEFT JOIN Casting_Data ON Artist.Art_Id= Casting_Data.Art_Id
UNION ALL
SELECT*FROM Artist
RIGHT JOIN Casting_Data ON Artist.Art_Id= Casting_Data.Art_Id;