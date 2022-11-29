CREATE DATABASE tech_task;

USE tech_task;

CREATE TABLE calls (
		id INT,
        called_number VARCHAR(25),
        date_call DATE,
        duration_in_sec INT,
        incoming_number INT
);        

CREATE TABLE clients_crm (
		id INT,
        FirstName VARCHAR(25),
        LastName VARCHAR(25),
        PhoneNumber VARCHAR(25),
        CreationDate DATE
); 

INSERT INTO calls ( id, called_number, date_call , duration_in_sec ,incoming_number ) VALUES
					(1021, '669757676', '2021-12-23' , 69, 876567567),
                    (1023, '669757677', '2021-12-24' , 15, 976567577),
                    (1021, '669757678', '2021-11-23' , 1, 876567567),
                    (1021, '669757676', '2021-11-23' , 22, 876567567),
                    (1054, '669757675', '2021-12-23' , 34, 996567514),
					(1023, '669757672', '2022-01-23' , 150, 976567577),
                    (1027, '669757676', '2022-03-23' , 153, 976557577)
;


INSERT INTO clients_crm ( id, FirstName, LastName , PhoneNumber ,CreationDate ) VALUES
					(1021, 'Mini', 'Palotes' , '876567567', '2020-12-23'),
                    (1023, 'Maxi', 'Zoquiliski' , '976567577', '2021-01-23'),
                    (1054, 'Piti', 'Pitillos' , '996567514' , '2021-11-10')
;



-- 1. Perform a simple query to list the number of calls per day.

SELECT *
FROM calls
ORDER BY date_call
;


-- 2. In our business, timing is key. A growth hacker needs to understand when clients are ﬁrst contacting us,
-- even if ﬁrst contact does not lead to a client record inscription in our CRM. For that purpose, 
-- he asks you to provide a table with the following structure :
-- a.    client ID if available
-- b.    client First Name if available
-- c.   client Last Name if available
-- d.    ﬁrst call date
-- e.    average calls duration for that client if available
-- f.    client phone number


-- CREATE TABLE growth_hacker AS
-- SELECT p.id, p.FirstName, p.LastName, s.date_call,s.duration_in_sec, s.incoming_number
-- FROM clients_crm p
-- LEFT JOIN calls s 
-- ON p.id = s.id
-- ORDER BY id;


-- SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

CREATE TABLE growth_hacker2 AS
SELECT p.id, p.FirstName, p.LastName, IF(min(s.date_call) IS NULL, p.CreationDate,min(s.date_call)) AS first_Call_Date, s.duration_in_sec, IF(s.incoming_number IS NULL,  s.incoming_number, p.PhoneNumber) as phone_number
FROM clients_crm p
LEFT JOIN calls s 
ON s.incoming_number = p.PhoneNumber
GROUP BY p.id
ORDER BY p.id;


-- 3. In a phone-based model, one of the main difﬁculties is to properly track clients. 
-- As mentioned before, you can see that not all clients are referenced in the calls table, 
-- and vice versa: To deal with this difﬁculty, management suggests to track the transformation 
-- rate at a daily bucket. In other words, for each day, we want to know the ratio of the number 
-- of clients with a record in our CRM out of the number of calls received that same day.
-- Can you provide the report with ALL clients and ALL calls taken into account ? With the following structure:
-- a.    day
-- b.    number of calls
-- c.   number of clients
-- d.    transformation rate (clients / calls)
-- calls ( id, called_number, date_call , duration_in_sec ,incoming_number )
-- clients_crm ( id, FirstName, LastName , PhoneNumber ,CreationDate )


SELECT DAY(c.date_call) AS day, IF (cr.PhoneNumber IS Null, 'NO CLIENT', cr.PhoneNumber) , c.id, count(c.id)/count(c.incoming_number) as transformation_rate
FROM calls c
LEFT JOIN clients_crm cr
ON c.id = cr.id
ORDER BY day ;


-- 4.  Looking more deeply at the client_crm table, it seems that we have clients with identical phone numbers!
--  Can you suggest a query to get rid of those « duplicates »? (we want to keep only one unique client record per phone number)

CREATE TABLE dupl_client_crm LIKE clients_crm;

INSERT INTO dupl_client_crm SELECT * FROM clients_crm;

DELETE n1 FROM clients_crm n1, dupl_client_crm  n2 
WHERE n1.id = n2.id;



