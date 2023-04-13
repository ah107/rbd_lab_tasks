CREATE DATABASE taxi;
\l
\c taxi
CREATE SCHEMA taxi;
CREATE TABLE taxi.passenger( id serial PRIMARY KEY );
CREATE TABLE taxi.passenger_rating(id serial PRIMARY KEY , behavior int NOT NULL, punctuality int NOT NULL);
CREATE TABLE taxi.driver_rating(id serial PRIMARY KEY , skills int NOT NULL, car_condition int NOT NULL, complying_with_traffic_regulations int NOT NULL);
CREATE TABLE taxi.driver(id serial PRIMARY KEY , photo bytea);
CREATE TABLE taxi.driver_car(id serial PRIMARY KEY , color varchar(25),registration_number varchar(25));
CREATE TABLE taxi.car(id serial PRIMARY KEY , brand varchar(100),model varchar(100));
CREATE TABLE taxi.vehicle_type(id serial PRIMARY KEY , name varchar(50) NOT NULL);
CREATE TABLE taxi.user(id serial PRIMARY KEY , first_name varchar(100), last_name varchar(100), mobile_number varchar(100), email varchar(100));
CREATE TABLE taxi.ride(id serial PRIMARY KEY , distance decimal NOT NULL);
CREATE TABLE taxi.payment_type(id serial PRIMARY KEY , name varchar(50) NOT NULL);
CREATE TABLE taxi.payment(id serial PRIMARY KEY , money decimal NOT NULL);
CREATE TABLE taxi.area(id serial PRIMARY KEY , name varchar(256) NOT NULL);
CREATE TABLE taxi.address(id serial PRIMARY KEY , street varchar(100) NOT NULL, house_number varchar(25), apartment_number varchar(25), zip_code varchar(25) NOT NULL, city varchar(25) NOT NULL, country varchar(25) NOT NULL  );
INSERT INTO
  taxi.address (street, house_number, apartment_number, zip_code, city, country)
VALUES
  ('Grunwaldzka', '2a', '3', '80-000', 'Gdansk', 'Poland'),
  ('Norwida', '19', '1c','81-000', 'Gdynia', 'Poland'),
  ('Koszykowa', '86', '23',  '02-008', 'Warszawa', 'Poland'),
  ('Koszykowa', '87', '232',  '02-008', 'Warszawa', 'Poland'),
  ('Koszykowa', '88', '2323',  '02-008', 'Warszawa', 'Poland');
INSERT INTO
  taxi.passenger_rating (behavior, punctuality)
VALUES
 ('5','5'),
 ('3','5'),
 ('2','4'),
 ('1','5'),
 ('4','1');

INSERT INTO
  taxi.driver_rating (skills, car_condition, complying_with_traffic_regulations)
VALUES
 ('5','5','8'),
 ('2','3','5'),
 ('1','4','7'),
  ('5','5','5'),
 ('4','4','4');
INSERT INTO
  taxi.driver (photo)
VALUES
 ('134'),
 ('123'),
 ('123'),
 ('123'),
 ('123');


INSERT INTO
  taxi.driver_car (color, registration_number)
VALUES
 ('blue','M523533'),
 ('yellow','A563263'),
 ('red','GD4234523'),
 ('red','ED5154252'),
 ('pink','E1453453');


INSERT INTO
  taxi.car (brand ,model)
VALUES
 ('BMW','e49'),
 ('Mercedes','S34'),
 ('KIA','K2'),
 ('Ferrari','M1'),
 ('Ferrari','M2');


INSERT INTO
  taxi.vehicle_type(name)
VALUES
('Sedan'),
('Hatchback'),
('Hatcback'),
('Sports car'),
('Sports car');

INSERT INTO
  taxi.user(first_name, last_name, mobile_number, email)
VALUES
 ('Elon','Musk','48562909909','elmus@gmail.com'),
('Louis','Armstrong','48564949509','louarm@gmail.com'),
('Kurt','Cobain','48562888888','kucoba@gmail.com'),
('Cristiano','Ronaldo','485629077788','cristiano@gmail.com'),
('Frank','Sinatra','48562887709','nycgigachad@gmail.com');
INSERT INTO
  taxi.ride( distance)
VALUES
('12.3'),
('6.5'),
('5.4'),
('2.77'),
('3.99');

INSERT INTO
  taxi.payment_type (name)
VALUES
 ('card'),
('cash'),
('cash'),
('card'),
('card');


INSERT INTO
  taxi.payment(money)
VALUES
 ('5345'),
 ('56.45'),
 ('56.6'),
 ('45.7'),
 ('55.99');


INSERT INTO
  taxi.area(name)
VALUES
('LA'),
('NYC'),
('Warsaw'),
('Berlin'),
('Minsk');



SELECT * FROM taxi.address;
SELECT * FROM taxi.passenger_rating;
SELECT * FROM taxi.driver_rating;
SELECT * FROM taxi.driver;
SELECT * FROM taxi.driver_car;
SELECT * FROM taxi.car;
SELECT * FROM taxi.vehicle_type;
SELECT * FROM taxi.user;
SELECT * FROM taxi.ride;
SELECT * FROM taxi.payment_type;
SELECT * FROM taxi.payment;
SELECT * FROM taxi.area;


DROP TABLE taxi.driver;
CREATE TABLE taxi.driver(
    id serial PRIMARY KEY , photo bytea,
    user_id int unique not null,
  CONSTRAINT fk__id
    FOREIGN KEY(user_id) REFERENCES taxi.user(id)
);
ALTER TABLE taxi.passenger_rating
  ADD CONSTRAINT fk
  FOREIGN KEY (id_passenger_rating_fk) REFERENCES taxi.passenger_rating(id);


TRUNCATE TABLE ;

