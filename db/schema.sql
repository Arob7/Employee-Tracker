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
CREATE TABLE role (
    id int AUTO_INCREMENT NOT NULL,
    title VARCHAR(30)NOT NULL,
    salary DECIMAL (5,2),
    department_id INT references department(id),
    PRIMARY KEY(id)
);
-- create table for employee
CREATE TABLE employee (
    id int NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30)NOT NULL,
    last_name VARCHAR(30)NOT NULL,
    role_id INT references role(id),
    manager_id int (10)NULL,
    PRIMARY KEY(id)
);
SELECT * FROM department;