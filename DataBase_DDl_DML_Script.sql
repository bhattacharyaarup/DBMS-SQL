/*
Need to create the below table 
SELECT * FROM Movie.actor;
SELECT * FROM Movie.director;
SELECT * FROM Movie.genres;
SELECT * FROM Movie.movie;
SELECT * FROM Movie.movie_genres;
SELECT * FROM Movie.movie_cast;
SELECT * FROM Movie.movie_direction;
SELECT * FROM Movie.rating;
SELECT * FROM Movie.reviewer;
-------- Not related to DataModel
SELECT * FROM Movie.employees;
SELECT * FROM Movie.quarterly_sales;*/

create database MOVIE;
-- 1.actor table
CREATE TABLE MOVIE.actor
(act_id INTEGER PRIMARY KEY,
 act_fname varchar(20),
 act_lname varchar(20),
 act_gender char(1)
);

-- 2.director table
CREATE TABLE MOVIE.director
(dir_id INTEGER PRIMARY KEY,
 dir_fname varchar(20),
 dir_lname varchar(20)
);

-- 3.genres table
CREATE TABLE MOVIE.genres
(gen_id INTEGER PRIMARY KEY,
 gen_title varchar(20)
);

-- 4.movie table
CREATE TABLE MOVIE.movie
(mov_id INTEGER PRIMARY KEY,
 mov_title varchar(20),
 mov_year integer,
 mov_time integer,
 mov_lang varchar(50),
 mov_dt_rel date,
 mov_rel_country varchar(10)
);

-- 5. reviewer table
CREATE TABLE MOVIE.reviewer
(rev_id INTEGER PRIMARY KEY,
 rev_name varchar(30)
);

-- 6. movie_direction
CREATE TABLE MOVIE.movie_direction
(dir_id integer,
 mov_id integer,
 foreign key(dir_id) references director(dir_id),
 foreign key(mov_id) references movie(mov_id)
);

-- 7. movie_cast table
CREATE TABLE MOVIE.movie_cast
(act_id integer,
 mov_id integer,
 role varchar(30),
 foreign key(act_id) references actor(act_id),
 foreign key(mov_id) references movie(mov_id)
);

-- 8. movie_genres tablr
CREATE TABLE MOVIE.movie_genres
(mov_id integer,
 gen_id integer,
 foreign key(mov_id) references movie(mov_id),
 foreign key(gen_id) references genres(gen_id)
);

-- 9. rating table
CREATE TABLE MOVIE.rating
(mov_id integer,
 rev_id integer,
 rev_stars integer,
 num_o_ratings integer,
 foreign key(mov_id) references movie(mov_id),
 foreign key(rev_id) references reviewer(rev_id)
);

-- DML Statements to INSERT records in the table
-- 1. actor
INSERT INTO MOVIE.actor VALUES
(1,'Vicky','Kaushal','M'),
(2,'Akshay','Kumar','M'),
(3,'Anushka','Sharma','F'),
(4,'Ranbir', 'Kapoor','M'),
(5,'Deepika','Padukone','F'),
(6,'Boman','Irani','M'),
(7,'Amir','Khan','M'),
(8,'James','Bond','M'),
(9,'Will','Smith','M'),
(10,'Dev','Adhikari','M');


-- 2. director
INSERT INTO MOVIE.director VALUES
(101,'Imitiaz','Ali'),
(102,'Akshay','Dhar'),
(103,'Steven','Spielberg'),
(104,'Rajkumar','Hirani'),
(105,'Ayan','Mukherji'),
(106,'Raj','Chakraborty'),
(107,'Dev','Adhikari'),
('108', 'Anurag', 'Singh');

-- 3. genres
INSERT INTO MOVIE.genres VALUES
(10,'Horror'),
(11,'Comedy'),
(12,'Sci-Fi'),
(13,'Drama'),
(14,'Adventure'),
(15,'Crime'),
(16,'Detective'),
(17,'Thriller');


-- 4. movie
INSERT INTO Movie.movie VALUES
(1001,'Yeh Jawani Deewani',2013,3,'Hindi','2013-05-15','India'),
(1002,'3 Idiots',2012,2,'Hindi','2012-02-10','India'),
(1003,'URI Surgical Strike',2019,3,'Hindi','2019-09-20','India'),
(1004,'Bhagajatin',2023,3,'Bengali','2023-08-10','India'),
(1005,'Kesari',2019,3,'Hindi','2019-08-21','India'),
(1006,'Unstoppable',2010,3,'English','2010-11-25','America'),
(1007,'Rockstar',2011,2,'Hindi','2011-02-14','India'),
(1008,'Men In Black',2016,3,'English','2016-07-18','America'),
(1009,'PK',2018,2,'Hindi','2018-06-24','India'),
(1010,'Amazon Obhijaan',2017,3,'Bengali','2017-11-06','Africa');

-- 5. reviewer
INSERT INTO Movie.reviewer VALUES
(201,'Arka Pathak'),
(202,'Milan Pal'),
(203,'Aditri Pathak'),
(204,'Shruti Harrison'),
(205,'Ritwik Mukherjee'),
(206,'Arindam Bhowmick');

-- 6. movie_direction
INSERT INTO Movie.movie_direction VALUES
(105,1001),(104,1002),(102,1003),(107,1004),(108,1005),(103,1006),(101,1007),(103,1008),(104,1009),(107,1010);

-- 7. movie_cast
INSERT INTO Movie.movie_cast VALUES
(1,1003,'Leading Actor'),
(2,1005,'Leading Actor'),
(3,1009,'Leading Actress'),
(4,1007,'Leading Actor'),
(4,1001,'Leading Actor'),
(5,1001,'Leading Actress'),
(6,1002,'Supporting Actor'),
(7,1002,'Leading Actor'),
(6,1002,'Leading Actor'),
(7,1009,'Leading Actor'),
(8,1006,'Leading Actor'),
(9,1008,'Leading Actor'),
(10,1004,'Leading Actor'),
(10,1010,'Leading Actor');

-- 8. movie_genres
INSERT INTO Movie.movie_genres VALUES
(1001,13),(1002,11),(1003,15),(1004,15),(1005,15),(1006,12),(1007,13),(1008,17),(1009,11),(1010,14);

-- 9.rating
INSERT INTO Movie.rating VALUES
(1001,201,5,5),
(1002,201,5,5),
(1002,202,5,5),
(1002,203,5,5),
(1002,204,5,5),
(1002,205,4,4),
(1003,201,5,5),
(1003,206,4,4),
(1004,202,5,5),
(1005,204,3,3),
(1006,205,5,5),
(1007,201,5,5),
(1007,203,5,5),
(1007,204,3,3),
(1007,206,4,4),
(1007,205,5,5),
(1008,202,4,4),
(1009,201,5,5),
(1009,206,5,5),
(1009,202,5,5),
(1009,205,4,4),
(1009,203,5,5),
(1010,203,5,5),
(1010,206,1,1),
(1010,201,5,5);

-- 11. employees
CREATE TABLE Movie.employees (
	id INT PRIMARY KEY,
	first_name VARCHAR (120),
	last_name VARCHAR (120),
	department VARCHAR (120), 
	salary DECIMAL (10,2)

	
);
INSERT INTO Movie.employees (id, first_name, last_name, department, salary) VALUES (1, 'Paul', 'Garrix', 'Corporate', 3547.25);
INSERT INTO Movie.employees (id, first_name, last_name, department, salary) VALUES (2, 'Astrid', 'Fox', 'Private Individuals', 2845.56);
INSERT INTO Movie.employees (id, first_name, last_name, department, salary) VALUES (3, 'Matthias', 'Johnson', 'Private Individuals', 3009.41);
INSERT INTO Movie.employees (id, first_name, last_name, department, salary) VALUES (4, 'Lucy', 'Patterson', 'Private Individuals', 3547.25);
INSERT INTO Movie.employees (id, first_name, last_name, department, salary) VALUES (5, 'Tom', 'Page', 'Corporate', 5974.41);
INSERT INTO Movie.employees (id, first_name, last_name, department, salary) VALUES (6, 'Claudia', 'Conte', 'Corporate', 4714.12);
INSERT INTO Movie.employees (id, first_name, last_name, department, salary) VALUES (7, 'Walter', 'Deer', 'Private Individuals', 3547.25);
INSERT INTO Movie.employees (id, first_name, last_name, department, salary) VALUES (8, 'Stephanie', 'Marx', 'Corporate', 2894.51);
INSERT INTO Movie.employees (id, first_name, last_name, department, salary) VALUES (9, 'Luca', 'Pavarotti', 'Private Individuals', 4123.45);
INSERT INTO Movie.employees (id, first_name, last_name, department, salary) VALUES (10, 'Victoria', 'Pollock', 'Corporate', 4789.53);

-- 12.quarterly_sales
CREATE TABLE Movie.quarterly_sales (
	employee_id INT REFERENCES employees(id),
	q1_2022 DECIMAL (10,2),
	q2_2022 DECIMAL (10,2),
	q3_2022 DECIMAL (10,2),
	q4_2022 DECIMAL (10,2)
	
);
INSERT INTO Movie.quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (8, 3471.41, 14789.25, 3478.34, 1254.23);
INSERT INTO Movie.quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (4, 5417.81, 12846.23, 8741.54, 3589.99);
INSERT INTO Movie.quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (10, 1547.52, 1269.66, 1478.65, 2474.33);
INSERT INTO Movie.quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (1, 8715.55, 8465.65, 24747.82, 3514.36);
INSERT INTO Movie.quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (3, 12774.51, 24784.31, 12223.34, 8451.51);
INSERT INTO Movie.quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (2, 4989.23, 5103.22, 4897.98, 5322.05);
INSERT INTO Movie.quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (7, 18415.66, 15279.37, 14634.44, 14445.12);
INSERT INTO Movie.quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (6, 2498.63, 8741.45, 3997.65, 2497.21);
INSERT INTO Movie.quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (5, 6349.74, 7555.55, 6944.35, 7788.01);
INSERT INTO Movie.quarterly_sales (employee_id, Q1_2022, Q2_2022, Q3_2022, Q4_2022) VALUES (9, 4485.36, 4101.50, 8787.45, 7648.90);
--