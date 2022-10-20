use lab20_mysql;


insert into customers (customer_id, name_cust, phone_number, email, adress, city, state, country , zip)
values (10001, "Pablo Picasso","+34 636 17 63 82", "-", "Paseo de la Chopera, 14", " Madrid", "Madrid", "Spain", "28045"),
(20001, "Abraham Lincoln","+1 305 907 7086", "-", "120 SW 8th St", " Miami", " Florida", "United States", "33130"),
(30001, "Napoléon Bonaparte","+33 1 79 75 40 00", "-", "40 Rue du Colisée", "Paris", "Île-de-France", "France", "75008");

SELECT * FROM lab20_mysql.customers; ## to display all the data we put before

insert into cars (cars_id, manufact, model, year_car, color, VIN)
values (0, "Volkswagen","Tiguan", "2019", "Blue", "3K096I98581DHSNUP"),
(1, "Peugeot","Rifter", "2019", "Red", "ZM8G7BEUQZ97IH46V"),
(2, "Ford","Fusion", "2018", "White", "RKXVNNIHLVVZOUB4M"),
(3, "Toyota","RAV4", "2018", "Silver", "HKNDGS7CU31E9Z7JW"),
(4, "Volvo","V60", "2019", "Gray", "DAM41UDN3CHU2WVF6"),
(5, "Volvo","V60 Cross Country", "2019", "Gray", "DAM41UDN3CHU2WVF6");

SELECT * FROM lab20_mysql.cars;

insert into salespersons (salespers_id, name_salesper, store)
values (00001, "Petey Cruiser","Madrid"),
(00002, "Anna Sthesia","Barcelona"),
(00003, "Paul Molive","Berlin"),
(00004, "Gail Forcewind","Paris"),
(00005, "Paige Turner","Mimia"),
(00006, "Bob Frapples","Mexico City"),
(00007, "Walter Melon","Amsterdam"),
(00008, "Shonda Leer","São Paulo");

SELECT * FROM lab20_mysql.salespersons;

insert into invoices (inv_id, date_num, cars_id, customer_id, salespers_id)
values (852399038, "2018-08-22","0", "20001", "00004"),
(731166526, "2018-12-31","3", "10001", "00006"),
(271135104, "2019-01-22","2", "30001", "00008");

SELECT * FROM lab20_mysql.invoices;
