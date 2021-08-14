DROP DATABASE IF EXISTS Emplouyee_DB;

CREATE DATABASE Emplouyee_DB;

USE Emplouyee_DB;

-- Data Tables --

-- departments --
CREATE TABLE departments (
id INT NOT NULL AUTO_INCREMENT,
department VARCHAR(30) NOT NULL,
PRIMARY KEY (id)
);

-- roles --
CREATE TABLE roles (
id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(30) NOT NULL,
salary DECIMAL(10,2) NOT NULL,
department_id INT,
PRIMARY KEY (id),
FOREIGN KEY (department_id) REFERENCES departments(id)
);


-- employees --
CREATE TABLE employees (
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
role_id INT NOT NULL,
manager_id INT,
PRIMARY KEY (id),
FOREIGN KEY (role_id) REFERENCES roles(id),
FOREIGN KEY (manager_id) REFERENCES employees(id)
);
