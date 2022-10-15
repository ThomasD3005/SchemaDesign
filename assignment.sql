CREATE TABLE person (
	id serial PRIMARY KEY,
	firstName varchar(255),
	lastName varchar(255),
	age int,
	location_id int,
	
	CONSTRAINT location_fk FOREIGN KEY(location_id) 
		REFERENCES location(id)
);


CREATE TABLE location (
	id serial PRIMARY KEY,
	city varchar(255),
	state varchar(255),
	country varchar(255)
);

CREATE TABLE interest(
	id serial PRIMARY KEY,
	title varchar(255)
);

CREATE TABLE person_interest(
	person_id int,
	interest_id int,
	
	CONSTRAINT person_int_FK FOREIGN KEY(person_id) 
		REFERENCES person(id),
	CONSTRAINT interest_fk FOREIGN KEY(interest_id) 
		REFERENCES interest(id)

);

INSERT INTO location (city, state, country ) values 
('Nashville', 'Tennessee', 'United States'), 
('Memphis', 'Tennessee', 'United States'),
('Phoenix', 'Arizona', 'United States'), 
('Denver', 'Colorado', 'United States');

INSERT INTO person (firstName, lastName, age, location_id) values
('Chickie', 'Ourtic', 21, 1),
('Hilton', 'OHanley', 37, 1),
('Barbie', 'Purver', 50, 3),
('Reeta', 'Sammons', 34,2),
('Abbott', 'Fisbburne', 49,1),
('Winnie', 'Whines', 19, 4),
('Samantha', 'Leese', 35,2),
('Edouard', 'Lorimer', 29, 1),
('Matheus', 'Shaplin', 27, 3),
('Donnell','Corney', 25 ,3),
('Wallis', 'Kauschke', 28, 3),
('Melva', 'Lanham', 20,2),
('Amelina', 'McNirlan', 22,4),
('Courtney', 'Holley', 22,1),
('Sigismond', 'Vala', 21,4),
('Jacquelynn', 'Halfacre', 24,2),
('Alanna', 'Spino', 25,3),
('Isa', 'Slight', 32,1),
('Kakalina', 'Renne', 26,3);

select * from person;


INSERT INTO interest (title) values
('Programming'),
('Gaming'),
('Computers'),
('Music'),
('Movies'),
('Cooking'),
('Sports');

INSERT INTO person_interest values 
(1,1),
(1,2),
(1,6),
(2,1),
(2,7),
(2,4),
(3,1),
(3,3),
(3,4),
(3,4),
(4,1),
(4,2),
(4,7),
(5,6),
(5,3),
(5,4),
(6,2),
(6,7),
(7,1),
(7,3),
(8,2),
(8,4),
(9,5),
(9,6),
(10,7),
(10,5),
(11,1),
(11,2),
(11,5),
(12,1),
(12,4),
(12,5),
(13,2),
(13,3),
(13,7),
(14,2),
(14,4),
(14,6),
(15,1),
(15,5),
(15,7),
(16,2),
(16,3),
(16,4),
(17,1),
(17,3),
(17,5),
(17,7),
(18,2),
(18,4),
(18,6),
(19,1),
(19,2),
(19,3),
(19,4),
(19,5),
(19,6),
(19,7);

UPDATE person SET age= age+1 WHERE id in (1,4,5,6,8,12,14,18);

DELETE FROM person_interest where person_id in (2,17);
DELETE FROM person where id in (2,17);

SELECT firstName,lastName from person;

SELECT firstName, lastName, city,state from person JOIN location ON person.location_id = location.id where location_id = 1;

select city, count(person) from person join location on person.location_id = location.id GROUP BY location.id;

SELECT title, count(person_id) from interest join person_interest on person_interest.person_id = interest.id group by interest.id;

--Write a query that finds the names (first and last) of all the people who live in Nashville, TN and are interested in programming (Columns to SELECT = firstName, lastName, city, state, & interest title)


SELECT firstName,lastName, city, state, title from person 
join location on person.location_id = location.id
join person_interest on person.id = person_interest.person_id
join interest on person_interest.interest_id = interest.id
where person_interest.interest_id = 1;



