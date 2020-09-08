USE employee_tracker_db;

-- DEPARTMENT
INSERT INTO department (id, name)
VALUES (1, "HR"),(2,"Engineering"),(3,"Accounting"),(4,"Sales");


-- ROLE
INSERT INTO role (id, title, salary, department_id)
VALUE (1,"Sales Manager", 44000.00, 4);
INSERT INTO role (id, title, salary, department_id)
VALUE (2,"Bookkeeper", 38000, 3);
INSERT INTO role (id, title, salary, department_id)
VALUE (3,"Recruiter", 60000, 1);
INSERT INTO role (id, title, salary, department_id)
VALUE (4,"Quality Engineer", 70000, 2);
INSERT INTO role (id, title, salary, department_id)
VALUE (5,"Sales Rep", 35000, 4);
INSERT INTO role (id, title, salary, department_id)
VALUE (6,"HR Manager", 88000, 1);
INSERT INTO role (id, title, salary, department_id)
VALUE (7,"CFO", 98000, 3);
INSERT INTO role (id, title, salary, department_id)
VALUE (8,"Chief Engineer", 95000, 2);
INSERT INTO role (id, title, salary, department_id)
VALUE (9,"HR Generalist", 55000, 1);
