CREATE	DATABASE OFFICE;


CREATE TABLE EMPLOYEE(
ID INT PRIMARY KEY,
NAME VARCHAR (50),
AGE INT NOT NULL
);

SELECT * FROM EMPLOYEE;

INSERT INTO EMPLOYEE
(ID, NAME, AGE)
VALUES
(101, 'VAIBHAV', 26),
(102, 'GANESH', 23);

CREATE TABLE DATA1(
ID INT PRIMARY KEY,
NAME VARCHAR (50),
YEAR INT NOT NULL
);

DROP TABLE DATA1;

INSERT INTO DATA1
(ID, NAME, YEAR)
VALUES
(101, 'VAIBHAV', 1997),
(102, 'GANESH', 2000),
(103, 'ARYAN', 2020);

select * FROM DATA1;
SELECT * FROM EMPLOYEE;

select * from employee where age > 20;
select * from data1 where year < 2020;

ALTER TABLE employee
ADD city VARCHAR(50);

UPDATE employee.city
SET City = 'NAGPUR'
WHERE ID = 101;

UPDATE Employee
SET City = 'NAGPUR'
WHERE ID=101;

select * FROM employee;
select * FROM DATA1;

UPDATE Employee
SET City = 'MUMBAI'
WHERE ID=102;

select * FROM employee WHERE AGE <25;

select * FROM employee WHERE AGE BETWEEN 23 AND 26;

select * FROM employee WHERE CITY IN ("NAGPUR");

select * FROM employee LIMIT 2;

select * FROM employee
ORDER BY CITY asc;

select MAX(AGE) FROM employee;
select avg(AGE) FROM employee;

select CITY, count(NAME)
FROM employee
GROUP BY CITY;

select count(NAME), CITY
FROM employee
GROUP BY CITY
having max(AGE)>25;

UPDATE employee
SET ID = '1002'
WHERE ID = '102';

select * FROM employee;
select * FROM data1;data1data1data1data1data1data1

SELECT * FROM office.data1;

select sum(year) from data1;

select avg(year) from data1;

select max(year) from data1;

select min(year) from data1;

update data1 set year = 2021, 
where year = 2020;

UPDATE office.data1 
SET year = 2021 
WHERE year = 2020;

SELECT DISTINCT id FROM DATA1;

select * from data1 where id like '101';

select * from data1;

select distinct NAME AND ID, year FROM DATA1;
SELECT DISTINCT name, id, year
FROM data1;

SELECT name
FROM data1
GROUP BY name
HAVING COUNT(id) > 1 AND COUNT(year) > 1;








INSERT INTO DATA1
(ID, NAME, YEAR)
VALUES
(104, 'RAJ', 1998),
(105, 'GANESH', 2001),
(106, 'ARYAN', 2010);

select * from data1;

select id, name from data1 where id between 101 and 105;

UPDATE data1 SET year = 100 default WHERE year is null;

UPDATE data1 SET year = 100 WHERE year IS NULL;

replace data1 SET year = 2012 WHERE year = 2010;

UPDATE data1
SET year = 2010
WHERE year = 2012;

UPDATE data1 AS d1
SET d1.year = 2010
WHERE d1.year = 2012;

UPDATE data1 SET year = 2010 WHERE id = 103;

INSERT INTO DATA1 (ID, NAME)
VALUES
(107, "VIKRAM");

INSERT	INTO	DATA1 
( ID, NAME)
VALUES
( 109, 'VT');

ALTER TABLE data1
ALTER COLUMN year SET DEFAULT 2050;

ALTER TABLE DATA1 ADD COLUMN 'SURNAME' varchar(50);

ALTER TABLE data1 
ADD COLUMN surname VARCHAR(50);

ALTER TABLE data1 
ADD COLUMN SALARY int;

ALTER TABLE data1 
ADD COLUMN BONUS int;

ALTER TABLE data1
ALTER COLUMN SALARY SET DEFAULT 25000;

select * from data1;
UPDATE data1 SET SALARY = 25000 WHERE SALARY IS NULL;
UPDATE data1 SET SALARY = 25000 WHERE SALARY IS NULL;
UPDATE data1
SET SALARY = 25000
WHERE SALARY IS NULL;

UPDATE data1
SET BONUS = 5000
WHERE BONUS IS NULL;

UPDATE data1
SET surname = 'THAKUR'
WHERE surname IS NULL;


SET SQL_SAFE_UPDATES = 0;

sql-mode="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";
sql-mode="NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";
sql-mode="";

select * from data1;
DELETE 'BONUS' FROM data1;

UPDATE your_data1
SET bonus = NULL;
SHOW TABLES;

ALTER TABLE table_name ADD COLUMN column_name datatype;

ALTER TABLE data1 delete bonus;
ALTER TABLE table_name ADD COLUMN column_name datatype;

UPDATE data1
SET BONUS = NULL;

ALTER TABLE DATA1
CHANGE COLUMN BONUS BONUS_2023 INT;

DROP DATA1 BONUS_2023;

ALTER TABLE DATA1
DROP COLUMN BONUS_2023;

SELECT NAME, COUNT(*) FROM DATA1 GROUP BY NAME HAVING COUNT(*) > 1;

SELECT * FROM DATA1 JOIN employee ON DATA1.ID = employee.ID;

SELECT * FROM DATA1 JOIN employee ON DATA1.NAME = employee.NAME;

SELECT NAME FROM DATA1
UNION
SELECT NAME FROM employee;

SELECT ID FROM DATA1
UNION
SELECT ID FROM employee;

SELECT NAME FROM DATA1 WHERE NAME IN (SELECT NAME FROM employee);

SELECT ID  FROM DATA1 LIMIT 5 DESC;
SELECT ID FROM DATA1 ORDER BY ID DESC LIMIT 5;

SELECT ID FROM DATA1 ORDER BY ID asc LIMIT 5;

SELECT column1, 
       CASE 
           WHEN condition THEN 'Value1'
           ELSE 'Value2'
       END AS new_column
FROM table_name;

SELECT DISTINCT column_name FROM table_name;

SELECT DISTINCT NAME FROM DATA1;

CREATE TABLE sales(
COST float,
UNIT int,
SALES int
);

UPDATE TABLE SALES PRODUCT NAME;

ALTER TABLE sales
ADD PRODUCT NAME  VARCHAR(50);

ALTER TABLE sales
ADD COLUMN product_name VARCHAR(50);

select * FROM SALES;

INSERT INTO sales
(product_name, cost, unit, selling_price)
VALUES
('ONI', 100, 5, 120 ),
('BUSH', 100, 10, 110 ),
('VID', 100, 25, 150 );


ALTER TABLE sales
RENAME COLUMN sales TO selling_price;

SELECT PRODUCT_NAME, sum(SELLING_PRICE * UNIT) AS REVENUE
FROM SALES group by PRODUCT_NAME;

select * FROM DATA1;

select count(ID), YEAR
FROM DATA1 GROUP BY year
HAVING COUNT( ID ) > 2; 

SELECT * FROM data1 WHERE year != 2050;

select * from data1 as d inner join
employee as e on d.name = e.name;

select * from data1 as d left join
employee as e on d.name = e.name;

select * from data1 as d right join
employee as e on d.name = e.name;

select data1.name, employee.name
from data1
inner join employee on data1.name = employee.name;




select * from data1 as d right join
employee as e on d.name = e.name;

show tables;

select * from office;
select * from employees;
select * from employee;
select * from sales;
select * from data1;

select * from employees
where id !='104';

select * from employees
where modified_at > '2023-11-11'
and modified_at < '2024-11-11';

select * from ( select * 
from employees order by
salary desc limit 3 ) as T
order by salary limit 3;

select * from employees where id % 2 = 0;




select id, min(salary) as lowest_salary from employees
group by id;

SELECT id, MIN(salary) AS lowest_salary
FROM employees
GROUP BY id;

select distinct id from employees;

select * from employees;
select datediff ('2023-11-20', '2023-11-22');
select datediff(now(), '2020-03-22');




























































































 





















