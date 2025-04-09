use classicmodels;
select * from data1;
select avg(salary) from data1;

DELIMITER &&

CREATE PROCEDURE top_name()
BEGIN
    SELECT name, year, surname, salary
    FROM data1
    WHERE salary > 24000;
END &&

DELIMITER ;

call top_name();

call update_salary ('GANESH', 50000);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    modified_at TIMESTAMP
);

INSERT INTO employees (id, name, salary, modified_at) VALUES
(1, 'John Doe', 55000.00, '2023-11-20 08:30:00'),
(2, 'Jane Smith', 60000.00, '2023-11-19 12:45:00'),
(3, 'Alice Johnson', 48000.00, '2023-11-21 10:00:00'),
(4, 'Bob Williams', 51000.00, '2023-11-20 15:20:00'),
(5, 'Eva Davis', 62000.00, '2023-11-22 09:10:00');

select * from employees;

DELIMITER $$

CREATE TRIGGER update_modified_at
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    SET NEW.modified_at = CURRENT_TIMESTAMP;
END $$

DELIMITER ;

update employees
SET salary = 20000
WHERE salary is NULL;

SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT e.name, e.salary
FROM employees e
JOIN (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
    ORDER BY avg_salary DESC
    LIMIT 1
) AS d ON e.department_id = d.department_id;

SELECT name
FROM employees
WHERE employee_id NOT IN (
    SELECT employee_id
    FROM employee_qualifications
    WHERE qualification = 'MBA'
);





























