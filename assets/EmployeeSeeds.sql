-- INSERTS --
INSERT INTO departments (department)
VALUES  ("Accounting"), ("Sales"), ("Engineering"), ("Legal"), ("Office");

INSERT INTO roles (title, salary, department_id)
VALUES ("Accountant Lead", 135000, 1), ("Accountant", 112000, 1), ("Accountant Intern", 45000, 1), ("Sales Lead", 102000, 2), ("Sales Person", 90000, 2), ("Sales Intern",43000, 2), ("Engineer Lead", 132000, 3), ("Engineer", 113000, 3), ("Engineer Intern", 57000, 3), ("Lawyer Lead", 142000, 4), ("Lawyer", 128000, 4), ("Office Manager", 98000, 5), ("Office Assistant", 87000, 5), ("Office Intern", 32000, 5);

INSERT INTO employees (first_name, last_name, role_id)
VALUES ("James", "Dobbs", 7);
INSERT INTO employees (first_name, last_name, role_id, manager_id)
VALUES ("John", "Doe", 3, 1);


--              SELECTS --
-- Single --
SELECT * FROM employees WHERE id = 1;
-- ALL --

SELECT * FROM roles;
SELECT * FROM employees;

-- View All Employees join -- 
SELECT employees.id, employees.first_name, employees.last_name, roles.title, roles.salary, departments.department, employees.manager_id
FROM employees
INNER JOIN roles on roles.id = employees.role_id
INNER JOIN departments on departments.id = roles.department_id
ORDER BY employees.id;

-- View All Employees by Department -- 
SELECT employees.id, employees.first_name, employees.last_name, departments.department
FROM employees
INNER JOIN roles on roles.id = employees.role_id
INNER JOIN departments on departments.id = roles.department_id
ORDER BY employees.id;

-- View All Employees by Manager --
SELECT employees.id, employees.first_name, employees.last_name, employees.manager_id
FROM employees
INNER JOIN roles on roles.id = employees.role_id
INNER JOIN departments on departments.id = roles.department_id
ORDER BY employees.id;

-- View All Employees by Title -- 
SELECT employees.id, employees.first_name, employees.last_name, roles.title
FROM employees
INNER JOIN roles on roles.id = employees.role_id
INNER JOIN departments on departments.id = roles.department_id
ORDER BY employees.id;

-- View All Department -- 
SELECT * FROM departments;

-- View All Roles -- 
SELECT roles.id, roles.title FROM roles;

--              UPDATES --

-- UPDATE First Name --
UPDATE employees SET first_name = 'Johnny' WHERE id = 7;

-- UPDATE Last Name --
UPDATE employees SET last_name = 'Rocket' WHERE id = 7;

-- UPDATE Title --
UPDATE employees SET title = 10 WHERE id = 4;

-- UPDATE Manager --
UPDATE employees SET manager_id = 4 WHERE id = 7;

--              DELETE --

-- Remove Department --
DELETE FROM departments WHERE id = 9;
-- Remove Role --
DELETE FROM roles WHERE id = 18;
-- Remove Employee --
DELETE FROM employees WHERE id = 3;

--              ADD --

-- -- Add Department --
INSERT INTO departments (department)
VALUES  ("Debuggers");

-- -- Add Role --
INSERT INTO roles (title, salary, department_id)
VALUES ("Lead Debugger", 93000, 6);

-- -- Add Employee --
INSERT INTO employees (first_name, last_name, role_id, manager_id)
VALUES ("Jane", "Doe", 15, null);