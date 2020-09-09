USE employee_tracker_db;

-- DEPARTMENT SEEDS
INSERT INTO department (id, name)
VALUES (1, "HR"),(2,"Engineering"),(3,"Accounting"),(4,"Sales");


-- ROLE SEEDS
INSERT INTO roles (id, title, salary, department_id)
VALUE (1,"Sales Manager", 44000, 4);
INSERT INTO roles (id, title, salary, department_id)
VALUE (2,"Bookkeeper", 38000, 3);
INSERT INTO roles (id, title, salary, department_id)
VALUE (3,"Recruiter", 60000, 1);
INSERT INTO roles (id, title, salary, department_id)
VALUE (4,"Quality Engineer", 70000, 2);
INSERT INTO roles (id, title, salary, department_id)
VALUE (5,"Sales Rep", 35000, 4);
INSERT INTO roles (id, title, salary, department_id)
VALUE (6,"HR Manager", 88000, 1);
INSERT INTO roles (id, title, salary, department_id)
VALUE (7,"CFO", 98000, 3);
INSERT INTO roles (id, title, salary, department_id)
VALUE (8,"Chief Engineer", 95000, 2);
INSERT INTO roles (id, title, salary, department_id)
VALUE (9,"HR Generalist", 55000, 1);


-- EMPLOYEE SEEDS

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (1, "Alexis", "Robinson", 8, null);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (2, "Lisa", "Hannon", 7, null);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (3, "Teresa", "Stalls", 6, null);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (4, "Jonathan", "Miller", 1, null);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (5, "Melissa", "Arbo", 5, 1);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (6, "E'Keisha", "Reid", 9, 6);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (7, "Reonna", "Saltmarshall", 3, 6);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (8, "Lianne", "Mendez", 4, 8);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (9, "Zach", "Johnson", 2, 7);