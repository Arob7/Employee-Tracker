-- DROPS employee_tracker_db if it already exists
DROP DATABASE IF EXISTS employee_tracker_db;

-- creates the database employee_tracker_db and specified it for use
CREATE DATABASE employee_tracker_db;

USE employee_tracker_db;

-- create table for department
CREATE TABLE department (
    id int AUTO_INCREMENT NOT NULL,
    name VARCHAR(30)NOT NULL,
    PRIMARY KEY(id)
);

-- create table for role --- does not pull tables in MYSQL
CREATE TABLE roles (
    id int AUTO_INCREMENT NOT NULL,
    title VARCHAR(30)NOT NULL,
    salary DECIMAL (10,2),
    department_id int,
    FOREIGN KEY (department_id) references department(id),
    PRIMARY KEY(id)
);
-- create table for employee
CREATE TABLE employee (
    id int NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30)NOT NULL,
    last_name VARCHAR(30)NOT NULL,
    FOREIGN KEY (role_id) references roles(id),
    manager_id int (10)NULL,
    FOREIGN KEY (manager_id) references employee(manager_id),
    PRIMARY KEY(id)
);
SELECT * FROM department;
SELECT * FROM roles;
SELECT * FROM employee;

SELECT id
FROM department 
INNER JOIN roles
ON department.id = department_id;

SELECT id
FROM roles
INNER JOIN employee
ON roles.id = role_id;