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


    