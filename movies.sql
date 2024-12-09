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
 review_ID INT ,
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
