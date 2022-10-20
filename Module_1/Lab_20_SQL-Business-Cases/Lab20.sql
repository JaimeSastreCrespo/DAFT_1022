CREATE DATABASE lab20_mysql;
use lab20_mysql;

CREATE TABLE customers (
customer_id INT NOT NULL,
name_cust VARCHAR(60) NOT NULL,
phone_number VARCHAR(20),
email VARCHAR(40),
adress VARCHAR(60),
city VARCHAR(60),
state VARCHAR(60),
country VARCHAR(60),
zip VARCHAR(20),
PRIMARY KEY (customer_id)
);

CREATE TABLE salespersons (
salespers_id INT NOT NULL,
name_salesper VARCHAR(60) NOT NULL,
store VARCHAR(50),
PRIMARY KEY (salespers_id)
);

CREATE TABLE cars (
cars_id INT NOT NULL,
manufact VARCHAR(50) NOT NULL,
model VARCHAR(50),
year_car INT,
color VARCHAR(50),
PRIMARY KEY (cars_id)
);

CREATE TABLE invoices (
inv_id INT NOT NULL,
date_num date,
cars_id INT,
customer_id INT,
salespers_id INT NOT NULL,
PRIMARY KEY (inv_id),
FOREIGN KEY (cars_id) REFERENCES cars(cars_id),
FOREIGN KEY (salespers_id) REFERENCES salespersons(salespers_id),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


ALTER TABLE cars
ADD VIN int;
ALTER TABLE cars
MODIFY COLUMN VIN VARCHAR(50);


