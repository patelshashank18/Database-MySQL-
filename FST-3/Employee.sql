-- Create an “employee” database and 4 tables (hobby, employee, employee_salary, employee_hobby).
USE employee;
SELECT DATABASE();

-- 1. employee_hobby: id, foreign key of the employee, foreign key of hobby

CREATE TABLE hobby (
  hobby_id int NOT NULL AUTO_INCREMENT,
  hobby_name varchar(50) NOT NULL,
  PRIMARY KEY (hobby_id)
);


-- 2. employee: id, first_name, last_name, age, mobile_number, address

CREATE TABLE employee (
  id int NOT NULL AUTO_INCREMENT,
  first_name varchar(50) DEFAULT NULL,
  last_name varchar(50) DEFAULT NULL,
  age int DEFAULT NULL,
  mobile_number varchar(15) DEFAULT NULL,
  address varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
); 

-- 3 employee_salary: id, foreign key of employee, salary, date

CREATE TABLE employee_salary (
  id int NOT NULL AUTO_INCREMENT,
  employee_id int DEFAULT NULL,
  salary decimal(10,2) DEFAULT NULL,
  date date DEFAULT NULL,
  PRIMARY KEY (id),
  KEY employee_id (employee_id),
  CONSTRAINT employee_salary_ibfk_1 FOREIGN KEY (employee_id) REFERENCES employee (id)
); 

select * from employee_hobby     es 
-- 4 employee_hobby: id, foreign key of the employee, foreign key of hobby

CREATE TABLE employee_hobby (
  id int NOT NULL AUTO_INCREMENT,
  employee_id int DEFAULT NULL,
  hobby_id int DEFAULT NULL,
  PRIMARY KEY (id),
  KEY employee_id (employee_id),
  KEY hobby_id (hobby_id),
  CONSTRAINT employee_hobby_ibfk_1 FOREIGN KEY (employee_id) REFERENCES employee (id),
  CONSTRAINT employee_hobby_ibfk_2 FOREIGN KEY (hobby_id) REFERENCES hobby (hobby_id)
);

-- Insert multiple data in all tables.

-- insert in table 1 hobby table.

   INSERT INTO hobby (hobby_name)
   VALUES ('Cricket'), ('Reading'), ('Music'), ('Travelling');



   INSERT INTO hobby(hobby_name)
   VALUES
   ('Cricket'), 
   ('Reading'),
   ('Music'),
   ('Traveling'),
   ('Photography');
  
  Select * FROM hobby h ;



-- Insert in table 2 employee table.
   
   INSERT INTO employee
   (first_name, last_name, age, mobile_number, address)
   VALUES
   ('Jigar', 'Patel', 25, '9876543210', 'Gandhinagar'),
   ('Rahul', 'Sharma', 28, '9876543211', 'Ahmedabad'),
   ('Priya', 'Patel', 24, '9876543212', 'Vadodara'),
   ('Amit', 'Shah', 30, '9876543213', 'Surat'),
   ('Neha', 'Mehta', 27, '9876543214', 'Rajkot');

-- Insert in table 3 employee_Salary
   INSERT INTO employee_salary
   (employee_id, salary, date)
   VALUES
   (1, 35000.00, '2026-01-10'),
   (2, 40000.00, '2026-01-10'),
   (3, 32000.00, '2026-01-10'),
   (4, 45000.00, '2026-01-10'),
   (5, 38000.00, '2026-01-10');

   SET FOREIGN_KEY_CHECKS = 0;
   INSERT INTO employee_hobby
   (employee_id, hobby_id)
   VALUES
   (1, 1),
   (1, 3),
   (2, 2),
   (2, 4),
   (3, 3),
   (3, 5),
   (4, 1), 
   (4, 5),
   (5, 2),
   (5, 4);

   SET FOREIGN_KEY_CHECKS = 1;
-- 1. update employee 
   UPDATE employee
   SET
    first_name = 'Jigar',
    last_name = 'Patel',
    age = 26,
    mobile_number = '9876500000',
    address = 'Ahmedabad'
   WHERE id = 1;

-- 2. update hobby
   UPDATE hobby
   SET hobby_name = 'Football'
   WHERE hobby_id = 1;

-- 3. Update employee_salary

   UPDATE employee_salary
   SET
    salary = 40000.00,
    date = '2026-02-10'
   WHERE id = 1;

-- 4. Update employee_hobby

   UPDATE employee_hobby
 SET
    employee_id = 1,
    hobby_id = 2
 WHERE id = 1;

-- 1. Delete 2 records from employee
   DELETE FROM employee
   WHERE id IN (1, 2);

-- 2. Delete 2 records from hobby
   DELETE FROM hobby
   WHERE hobby_id IN (1, 2);

-- 3. Delete 2 records from employee_hobby
   DELETE FROM employee_hobby
   WHERE id IN (1, 2);

-- 4. Delete 2 records from employee_salary
   DELETE FROM employee_salary
   WHERE id IN (1, 2);


-- SELECT @@FOREIGN_KEY_CHECKS;
   SET FOREIGN_KEY_CHECKS = 0;
   TRUNCATE TABLE hobby;
   TRUNCATE TABLE employee;
   TRUNCATE TABLE employee_salary;
   TRUNCATE TABLE employee_hobby;
   SET FOREIGN_KEY_CHECKS = 1;




-- count for verification
    SELECT COUNT(*) AS total FROM employee;
    SELECT * FROM hobby;
    SELECT * FROM employee;
    SELECT * FROM employee_salary;
    SELECT * FROM employee_hobby;


-- Create a select single query to get all employee name, all hobby_name in single column

SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    h.hobby_name AS hobby_name
FROM employee e
JOIN employee_hobby eh
    ON e.id = eh.employee_id
JOIN hobby h
    ON eh.hobby_id = h.hobby_id;


-- SELECT select query to get employee name, total salary of employee, hobby name(comma-separated - you need to use subquery for hobby name).
SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    SUM(es.salary) AS total_salary,
    (
        SELECT GROUP_CONCAT(h.hobby_name SEPARATOR ', ')
        FROM hobby h
        JOIN employee_hobby eh
        ON eh.hobby_id = h.hobby_id
        WHERE eh.employee_id = e.id
    ) AS hobby_name
FROM employee e
JOIN employee_salary es
ON e.id = es.employee_id
GROUP BY e.id, e.first_name, e.last_name;       

select * from employee_hobby es
