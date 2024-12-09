-- AMINE LAMGARMAJ
-- aminelmgrmj3@gmail.com

--first push 


--creation of table subscription----------------------------

create table subscription(
subscription_ID INT AUTO_INCREMENT PRIMARY KEY ,
subscription_Type ENUM('Basic', 'Premium') NOT NULL,
monthlyFee decimal (10,2) NOT NULL DEFAULT 0.00
);

--creation of table movie----------------------------
create table movie
(
    movie_ID INT AUTO_INCREMENT PRIMARY KEY ,
 title VARCHAR(225) NOT NULL,
 genre VARCHAR(100) NOT NULL, 
 release_Year INT NOT NULL,
 duration INT, 
 rating varchar(10) 
);

--creation of table movie-----------------------------

--creation of table user_info------------------------------
 create table user_info(
user_ID INT AUTO_INCREMENT PRIMARY KEY ,
first_name VARCHAR(100) NOT NULL, 
last_name VARCHAR(100) NOT NULL, 
email VARCHAR(100) NOT NULL UNIQUE,
    registration_date date 
) 
--creation of table review------------------------------------
create table review
(
 review_ID INT PRIMARY key AUTO_INCREMENT ,
    review_Text VARCHAR(200) NULL,
    review_Date DATE
);

--creation of table review----------------------------------



--creation of watch history-------------------------------------
create table watchHistory 

(
     watchhistory_ID INT AUTO_INCREMENT PRIMARY KEY,
 watch_date INT,
  completion_Percentage INT DEFAULT 0 
  );


--creation of watch history-----------------------


--add relation subscrion_ID---------------------------

ALTER TABLE user_info
ADD COLUMN subscription_ID INT;


ALTER TABLE user_info
ADD CONSTRAINT fk_subscription_id 
FOREIGN KEY (subscription_ID)
REFERENCES subscription(subscription_ID)

--add relation subscrion_ID------------------------------------
ALTER TABLE review
ADD COLUMN user_ID INT;

ALTER TABLE review
 ADD CONSTRAINT fk_user_ID
  FOREIGN KEY(user_ID) 
  REFERENCES user_info(user_ID);


--add relation subscrion_ID--------------------------------------------


--add relation movie_ID to rieview------------------------------------
ALTER TABLE review
 ADD COLUMN movie_ID INT;

 ALTER TABLE review 
 ADD CONSTRAINT fk_movie_ID 
 FOREIGN KEY (movie_ID)
  REFERENCES movie(movie_ID);

--add relation movie_ID----------------------------------------------------

--add relation movie_ID to watchhistory-----------------------------------

ALTER TABLE watchhistory
ADD COLUMN movie_ID INT;

ALTER TABLE watchhistory
 ADD CONSTRAINT fk_movieID 
 FOREIGN KEY (movie_ID) 
 REFERENCES movie(movie_ID);



--add relation movie_ID to watchhistory-------------------------------------



--add relation user_id to watchhistory-----------------------------------------

ALTER TABLE watchhistory
ADD COLUMN user_ID INT

ALTER TABLE watchhistory
 ADD CONSTRAINT fk_userid 
 FOREIGN KEY (user_id) 
 REFERENCES user_info(user_id);

--add relation user_id to watchhistory---------------------------------------




-----------insert subscription table
INSERT INTO subscription (subscription_Type, monthlyFee)
VALUES 
('Basic', 9.99),
('Premium', 15.99);


------------------------insert movie table
INSERT INTO movie (title, genre, release_Year, duration, rating)
VALUES 
('Comedy Chaos', 'Comedy', 2021, 120, 4.5),
('Drama Dreams', 'Drama', 2019, 135, 4.0),
('Sci-Fi Spectacular', 'Sci-Fi', 2023, 150, 4.7),
('Data Science Adventures', 'Documentary', 2022, 90, 4.8),
('Romantic Retreat', 'Romance', 2020, 110, 3.9),
('Historical Heist', 'History', 2018, 140, 4.2),
('Laugh Riot', 'Comedy', 2022, 100, 3.8),
('Epic Adventure', 'Action', 2021, 160, 4.6);

--------------------------insert users_info
INSERT INTO user_info (first_name, last_name, email, registration_date, subscription_ID)
VALUES 
('John', 'Doe', 'john.doe@example.com', '2023-01-10', 1),
('Jane', 'Smith', 'jane.smith@example.com', '2023-05-15', 2),
('Alice', 'Brown', 'alice.brown@example.com', '2023-03-20', 1),
('Bob', 'White', 'bob.white@example.com', '2023-07-25', 2);

--------------------------insert review

INSERT INTO review (review_Text, review_Date, user_ID, movie_ID)
VALUES 
('Amazing documentary!', '2023-02-01', 1, 4),
('Not bad, but could be better.', '2023-06-10', 2, 7),
('Loved the storyline!', '2023-07-20', 3, 6),
('An absolute masterpiece.', '2023-08-05', 4, 3);


---------------------------insert watch history
INSERT INTO watchHistory (watch_date, completion_Percentage, movie_ID, user_ID)
VALUES 
('2023-12-01', 100, 1, 1),
('2023-12-01', 50, 2, 1),
('2023-12-02', 100, 3, 2),
('2023-12-03', 100, 4, 3),
('2023-12-03', 80, 7, 4),
('2023-12-04', 100, 6, 4);


