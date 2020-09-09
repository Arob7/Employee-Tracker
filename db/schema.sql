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

-- create table for role 
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
    role_id int (10)NULL,
    FOREIGN KEY (role_id) references roles(id),
    manager_id int (10)NULL,
    FOREIGN KEY (manager_id) references employee(id),
    PRIMARY KEY(id)
);
SELECT * FROM department;
SELECT * FROM roles;
SELECT * FROM employee;

SELECT roles.title, roles.salary, employee.last_name, employee.first_name
FROM roles
INNER JOIN employee
ON employee.role_id = role_id;

SELECT roles.id, roles.title, roles.salary, department.name As Dept
FROM roles
INNER JOIN department on (roles.department_id = department.id);
