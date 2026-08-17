CREATE DATABASE EmployeeData;

USE EmployeeData;

CREATE TABLE employee  (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    salary DOUBLE
);


SHOW DATABASES;



SELECT * FROM employee;