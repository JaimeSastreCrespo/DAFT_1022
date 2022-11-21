CREATE DATABASE bank;
USE bank;


CREATE TABLE IF NOT EXISTS organizations (
id VARCHAR(128) NULL,
name_org VARCHAR(255));


DELIMITER $$
CREATE TRIGGER before_insert_organizations
BEFORE INSERT ON organizations
FOR EACH ROW
BEGIN
  IF new.id IS NULL THEN
    SET new.id = uuid();
  END IF;
END $$
DELIMITER ;


INSERT INTO organizations (id, name_org)
VALUES (NULL, 'Company1'), (NULL, 'Company2'),
(NULL, 'Company3'), (NULL, 'Company4'), (NULL, 'Company5');


ALTER TABLE organizations
ADD PRIMARY KEY (id);


create table transfers (
id VARCHAR(128) NULL,
amount_euro_cents INTEGER
 ) ;
 
 
DELIMITER $$
CREATE TRIGGER before_insert_transfers
BEFORE INSERT ON transfers
FOR EACH ROW
BEGIN
  IF new.id IS NULL THEN
    SET new.id = uuid();
  END IF;
END $$
DELIMITER ;


INSERT INTO transfers (id, amount_euro_cents)
VALUES (NULL, 2000), (NULL, 1200), (NULL, 70000), (NULL, 30000), (NULL, 83400),
(NULL, 30000), (NULL, 50000), (NULL, 23400), (NULL, 32000), (NULL, 510000), (NULL, 2300);


ALTER TABLE transfers
ADD PRIMARY KEY (id);


create table bank_accounts (
id VARCHAR(128) NULL,
organization_id VARCHAR(128),
FOREIGN KEY (organization_id) REFERENCES organizations(id)
 );
 
 
 DELIMITER $$
CREATE TRIGGER before_insert_bank_accounts
BEFORE INSERT ON bank_accounts
FOR EACH ROW
BEGIN
  IF new.id IS NULL THEN
    SET new.id = uuid();
  END IF;
END $$
DELIMITER ;


INSERT INTO bank_accounts (id, organization_id)
VALUES (NULL, 'badb9ada-6987-11ed-a1d2-a796f920b118'), (NULL, 'badba354-6987-11ed-a1d2-a796f920b118'),
(NULL, 'badba552-6987-11ed-a1d2-a796f920b118'), (NULL, 'badba688-6987-11ed-a1d2-a796f920b118'), (NULL, 'badba7be-6987-11ed-a1d2-a796f920b118')
;


ALTER TABLE bank_accounts
ADD PRIMARY KEY (id);

create table transactions (
id VARCHAR(128) NULL,
bank_account_id   VARCHAR(128),
subject_id VARCHAR(128),
subject_type VARCHAR(32),
settled_at  TIMESTAMP,
FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id),
FOREIGN KEY (subject_id) REFERENCES transfers(id)
 );
 
 
DELIMITER $$
CREATE TRIGGER before_insert_transactions
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
  IF new.id IS NULL THEN
    SET new.id = uuid();
  END IF;
END $$
DELIMITER ;


INSERT INTO transactions (id, bank_account_id, subject_id, subject_type, settled_at)
VALUES
(NULL, 'b1f8d250-6989-11ed-a1d2-a796f920b118','e288560e-6987-11ed-a1d2-a796f920b118',"CardTransaction",'2021-01-19 03:14:07'),
(NULL, 'b1f8dc46-6989-11ed-a1d2-a796f920b118','e2885b18-6987-11ed-a1d2-a796f920b118', "Transfer",'2022-01-20 04:14:07'),
(NULL, 'b1f8dee4-6989-11ed-a1d2-a796f920b118','e2885c76-6987-11ed-a1d2-a796f920b118',"CardTransaction",'2022-01-21 01:14:07'),
(NULL, 'b1f8e09c-6989-11ed-a1d2-a796f920b118','e2885d3e-6987-11ed-a1d2-a796f920b118',"Transfer",'2022-01-19 02:14:07'),
(NULL, 'b1f8e22c-6989-11ed-a1d2-a796f920b118','e2885de8-6987-11ed-a1d2-a796f920b118',"Transfer",'2022-04-01 05:14:07'),
(NULL, 'b1f8d250-6989-11ed-a1d2-a796f920b118','e2885e92-6987-11ed-a1d2-a796f920b118',"CardTransaction",'2021-01-19 03:14:07'),
(NULL, 'b1f8dc46-6989-11ed-a1d2-a796f920b118','e2885f32-6987-11ed-a1d2-a796f920b118', "Transfer",'2022-01-19 03:14:07'),
(NULL, 'b1f8dee4-6989-11ed-a1d2-a796f920b118','e2885fd2-6987-11ed-a1d2-a796f920b118',"Transfer",'2022-02-21 05:14:07'),
(NULL, 'b1f8e09c-6989-11ed-a1d2-a796f920b118','e2886072-6987-11ed-a1d2-a796f920b118',"CardTransaction",'2022-04-19 02:35:07'),
(NULL, 'b1f8e22c-6989-11ed-a1d2-a796f920b118','e2886112-6987-11ed-a1d2-a796f920b118',"Transfer",'2022-05-01 05:14:07'),
(NULL, 'b1f8d250-6989-11ed-a1d2-a796f920b118','e28861a8-6987-11ed-a1d2-a796f920b118',"Transfer",'2021-01-21 04:14:07');



ALTER TABLE transactions
ADD PRIMARY KEY (id);


create table card_transactions (
id VARCHAR(128) NULL,
transaction_id  VARCHAR(128),
amount_euro_cents INTEGER,
 FOREIGN KEY (transaction_id) REFERENCES transactions(id)
 );
 
 
 
 DELIMITER $$
CREATE TRIGGER before_insert_card_transactions
BEFORE INSERT ON card_transactions
FOR EACH ROW
BEGIN
  IF new.id IS NULL THEN
    SET new.id = uuid();
  END IF;
END $$
DELIMITER ;


INSERT INTO card_transactions (id, transaction_id, amount_euro_cents)
VALUES 
(NULL, 'bc9e6410-698c-11ed-a1d2-a796f920b118', 3400),
(NULL, 'bc9e6ffa-698c-11ed-a1d2-a796f920b118',40000),
(NULL, 'bc9e7784-698c-11ed-a1d2-a796f920b118',12000),
(NULL, 'bc9e7de2-698c-11ed-a1d2-a796f920b118',34000)
;


ALTER TABLE card_transactions
ADD PRIMARY KEY (id);

select month(tns.settled_at) as month, o.name_org,
sum(c_tns.amount_euro_cents)/(sum(tr.amount_euro_cents)+sum(c_tns.amount_euro_cents)) as proportion
from organizations o
join bank_accounts b 
on b.organization_id=o.id
left join transactions tns
on  tns.bank_account_id=b.id
left join card_transactions c_tns
on tns.id=c_tns.transaction_id
left join transfers tr
on tns.subject_id=tr.id
group by o.name_org, month 
order by month asc;