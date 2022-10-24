CREATE DATABASE IF NOT EXISTS recap;
USE recap;
CREATE TABLE clients(
	id_client INT,
    name VARCHAR(20),
    PRIMARY KEY (id_client)
);

INSERT INTO clients(id_client, name)
VALUES ('1',	'John Doe'),
		('2',	'John Smith'),
        ('3',	'Tom Red')
;

SELECT * FROM clients;

CREATE TABLE sales(
		po_id VARCHAR(20),
		year YEAR,
		amount FLOAT,
		department VARCHAR (20), 
		client_id INT,
		PRIMARY KEY( po_id, year),
		FOREIGN KEY (client_id)REFERENCES clients(id_client)
);

INSERT INTO sales(po_id, year, amount, department, client_id)
VALUES 	('02-Nov', 2020, 3000, 'Paris',1), 
		('02-Dec', 2021, 4000, 'Oslo',1),
		('04-Dec', 2021, 2000, 'Oslo',3), 
		('05-Dec', 2021, 1000, 'Milan',3);

SELECT * FROM sales;



    