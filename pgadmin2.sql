select * from Persons
DROP TABLE customer 
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

INSERT INTO Persons (PersonID, LastName, FirstName, Address, City) 
VALUES 
(1, 'Smith', 'John', '123 Maple Street', 'New York'),
(2, 'Doe', 'Jane', '456 Oak Avenue', 'Los Angeles'),
(3, 'Brown', 'Michael', '789 Pine Road', 'Chicago'),
(4, 'Taylor', 'Emily', '101 Birch Lane', 'Houston'),
(5, 'Johnson', 'Chris', '202 Cedar Drive', 'Phoenix')
(6, 'JoY', 'Chri', '20 Cedar Drive', 'Phoenix');

INSERT INTO Persons (PersonID, LastName, FirstName, Address, City) 
VALUES
(6, 'JoY', 'Chri', '20 Cedar Drive', 'Phoenix');

INSERT INTO Persons (PersonID, LastName, FirstName, Address, City) 
VALUES
(5, 'JoYa', 'Chris', '201 Cedar Drive', 'Phoenix');

DELETE FROM Persons 
WHERE PersonID = 5;

BEGIN TRANSACTION;
DELETE FROM Persons WHERE PersonID = 5;

-- To undo the DELETE:
ROLLBACK;

SELECT * DISTINCT city FROM persons;

SELECT * FROM persons
WHERE city='New York';

SELECT * FROM persons
WHERE city='Phoenix';

SELECT * FROM persons
ORDER BY city DESC;

SELECT * FROM persons
ORDER BY city asc;

SELECT * FROM persons
ORDER BY firstname ASC, personid DESC;

SELECT *
FROM persons
WHERE city = 'Phoenix'
AND firstname LIKE 'C%';

SELECT *
FROM persons
WHERE city = 'Phoenix' OR city = 'New York';

SELECT * FROM persons
WHERE NOT city = 'Spain';

SELECT * FROM persons
WHERE firstname NOT LIKE 'C%';

SELECT * FROM persons
WHERE personid BETWEEN 1 AND 5;

SELECT firstname, lastname
FROM persons;

select * from Persons

select * from employee

SELECT * FROM persons as p
INNER JOIN employee as e
ON p.personid = e.personid;

SELECT * FROM persons as p
LEFT JOIN employee as e
ON p.personid = e.personid;

SELECT * FROM persons as p
RIGHT JOIN employee as e
ON p.personid = e.personid;

SELECT * FROM persons as p
FULL OUTER JOIN employee as e
ON p.personid = e.personid;

SELECT amount FROM persons as p
FULL OUTER JOIN employee as e
ON p.personid = e.personid;

SELECT e.personid, e.lastname, e.firstname, e.amount FROM employee as e
FULL OUTER JOIN persons as p
ON p.personid = e.personid;

SELECT amount FROM persons as p
SELF JOIN employee as e
ON p.personid = e.personid;

SELECT personid, firstname
from persons
UNION
select personid, firstname
FROM employee

SELECT personid, firstname
from persons
UNION ALL
select personid, firstname
FROM employee

SELECT p.personid, p.firstname
from persons as p
UNION ALL
select e.personid, e.firstname
FROM employee as e

select * from employee

select * from persons

SELECT COUNT(personid), city
FROM persons
GROUP BY city;

SELECT COUNT(personid), city
FROM persons
GROUP BY city
HAVING COUNT(personid)  <= 1;

SELECT COUNT(personid), city
FROM persons
GROUP BY city
HAVING COUNT(personid)  > 1;

ALTER TABLE employee
ADD Email varchar(255);

SELECT 
    employee_id,
    firstname,
    lastname,
    LOWER(firstname || '.' || lastname || '@gmail.com') AS email
FROM 
    employee;

	UPDATE employee
SET email = LOWER(firstname || '.' || lastname || '@gmail.com');


ALTER TABLE employee
RENAME COLUMN personid TO employee_id;

select * from employee

SELECT AVG(amount)
FROM employee;

select * from employee

select * from persons

ALTER TABLE employee
ADD payment_date TIMESTAMP;

UPDATE employee
SET payment_date = 2025-01-02;

UPDATE employee
SET payment_date = '2025-01-02';

SELECT *
FROM employee
LIMIT 3;

select * from customers
SELECT COUNT(*) FROM customers;







































