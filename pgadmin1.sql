CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50),
    age INT,
    join_date DATE,
    total_spent DECIMAL(10, 2)
);

INSERT INTO customers (customer_id, first_name, last_name, city, country, age, join_date, total_spent) VALUES
(1, 'John', 'Doe', 'New York', 'USA', 25, '2023-01-10', 500.75),
(2, 'Jane', 'Smith', 'London', 'UK', 30, '2023-02-20', 300.50),
(3, 'Alice', 'Johnson', 'Sydney', 'Australia', 22, '2023-03-15', 150.00),
(4, 'Bob', 'Brown', 'New York', 'USA', 28, '2023-04-10', 700.00),
(5, 'Charlie', 'Davis', 'Toronto', 'Canada', 35, '2023-05-25', 400.00);


select * from customers

ALTER TABLE customers ADD email VARCHAR(100);

UPDATE customers SET email = 'john.doe@gmail.com' WHERE customer_id = 1;
UPDATE customers SET email = 'jane.smith@yahoo.com' WHERE customer_id = 2;
UPDATE customers SET email = 'michael.brown@hotmail.com' WHERE customer_id = 3;
UPDATE customers SET email = 'lisa.wilson@outlook.com' WHERE customer_id = 4;
UPDATE customers SET email = 'david.johnson@company.com' WHERE customer_id = 5;

UPDATE customers SET total_spent = total_spent + 50 WHERE customer_id = 3;

DELETE FROM customers WHERE country = 'Canada';

SELECT DISTINCT city FROM customers;

SELECT * FROM CUSTOMERS WHERE first_name LIKE 'J%'

SELECT * FROM CUSTOMERS order by total_spent Desc LIMIT 3;

SELECT * FROM CUSTOMERS order by total_spent ASC

SELECT * FROM customers
WHERE age BETWEEN 25 AND 35 AND city IN ('New York', 'London');

-- Customers not from the USA
SELECT * FROM CUSTOMERS WHERE country != 'USA'
SELECT * FROM customers WHERE NOT country = 'USA';

-- Total spent and average age of customers grouped by country
SELECT * FROM CUSTOMERS
AVG age
group by country

SELECT country, SUM(total_spent) AS total_revenue, AVG(age) AS avg_age
FROM customers
GROUP BY country;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

select * from orders

INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(1, 1, '2023-06-10', 250.00),
(2, 2, '2023-06-15', 150.00),
(3, 4, '2023-06-20', 300.00);

-- Inner Join: Customers who placed orders
SELECT * FROM customers
SELECT * FROM orders


SELECT c.first_name, o.order_date, o.amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;


SELECT c.first_name, o.order_date, o.amount_received
from orders as o
INNER JOIN customers as c
on o.customer_id = c.customer_id

ALTER TABLE orders
RENAME COLUMN amount TO amount_received;

SELECT c.customer_id, c.first_name, c.last_name, c.city, c.country, c.age, c.join_date, c.total_spent, o.amount_received
from customers as c
FULL OUTER JOIN orders as o
on o.customer_id = c.customer_id


SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    c.city, 
    c.country, 
    c.age, 
    c.join_date, 
    c.total_spent, 
    o.amount_received
FROM customers AS c
FULL OUTER JOIN orders AS o
ON o.customer_id = c.customer_id;


SELECT c.customer_id, c.first_name, c.last_name, c.city, c.country, c.age, c.join_date, c.total_spent, o.amount_received
from customers as c
FULL OUTER JOIN orders as o
on o.customer_id = c.customer_id

SELECT c.first_name, o.order_date, o.amount_received
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

Self Join: Customers from the same city

SELECT a.first_name AS customer1, b.first_name AS customer2, a.city
FROM customers a
JOIN customers b 
ON a.city = b.city AND a.customer_id != b.customer_id;

SELECT a.first_name AS customer1, b.first_name AS customer2, a.city
FROM customers a
JOIN customers b 
ON a.customer_id != b.customer_id;

-- Check if there are customers from Sydney
SELECT * FROM customers WHERE EXISTS 
(SELECT 1 FROM customers WHERE city = 'Sydney');

SELECT * FROM customers WHERE city = 'Sydney';

-- Combine customers from the USA and UK
SELECT first_name, country FROM customers WHERE country = 'USA'
UNION
SELECT first_name, country FROM customers WHERE country = 'UK';


-- Subquery: Find customers who spent more than the average spending
SELECT * FROM customers
WHERE total_spent > (SELECT AVG(total_spent) FROM customers);

SELECT AVG(total_spent) FROM customers;

-- ROW_NUMBER, RANK, DENSE_RANK
SELECT customer_id, first_name, total_spent,
    ROW_NUMBER() OVER (ORDER BY total_spent DESC) AS row_num,
    RANK() OVER (ORDER BY total_spent DESC) AS rank_num,
    DENSE_RANK() OVER (ORDER BY total_spent DESC) AS dense_rank
FROM customers;

-- LEAD, LAG, FIRST_VALUE, LAST_VALUE
SELECT customer_id, first_name, total_spent,
    LAG(total_spent) OVER (ORDER BY total_spent) AS prev_spent,
    LEAD(total_spent) OVER (ORDER BY total_spent) AS next_spent,
    FIRST_VALUE(total_spent) OVER (ORDER BY total_spent) AS min_spent,
    LAST_VALUE(total_spent) OVER (ORDER BY total_spent ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS max_spent
FROM customers;

select * from customers

select * from orders
select * from persons

SELECT customer_id, total_spent,
CASE
WHEN total_spent > 300 THEN 'Gold Customer'
WHEN total_spent = 300 THEN 'Silver Customer'
ELSE 'Broze Customer'
END AS Customer_Category
FROM customers;


SELECT 
    customer_id, 
    total_spent,
    CASE
        WHEN total_spent > 300 THEN 'Gold Customer'
        WHEN total_spent = 300 THEN 'Silver Customer'
        ELSE 'Bronze Customer'
    END AS customer_category
FROM customers;


UPDATE customers
SET 
    total_spent = 300,
     CASE
        WHEN total_spent > 200 THEN 'Gold Customer'
        WHEN total_spent = 200 THEN 'Silver Customer'
        ELSE 'Bronze Customer'
    END AS customer_category
WHERE total_spent = 200;


write query to add column of customer category in customer table 

ALTER TABLE customers
ADD COLUMN customer_category VARCHAR(50);

UPDATE customers
SET customer_category = CASE
    WHEN total_spent > 300 THEN 'Gold Customer'
    WHEN total_spent = 300 THEN 'Silver Customer'
    ELSE 'Bronze Customer'
END;

select * from customers

SELECT customer_id,total_spent,
CASE total_spent
WHEN 500 THEN 'PRIME'
WHEN 100 THEN 'PLUS'
ELSE 'REGULAR'
END AS customer_status
FROM customers









