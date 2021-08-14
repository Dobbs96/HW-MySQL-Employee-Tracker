DROP DATABASE IF EXISTS Emplouyee_DB;

CREATE DATABASE Emplouyee_DB;

USE Emplouyee_DB;

-- Data Tables --

-- departments --
CREATE TABLE departments (
---- id INT AUTO_INCREMENT
id INT NOT NULL AUTO_INCREMENT,
---- name VARCHAR(30) no null
name VARCHAR(30) NOT NULL,
---- PRIMARY KEY(id)
PRIMARY KEY (id)
);

-- roles --
CREATE TABLE roles (
---- id INT no null AUTO_INCREMENT
id INT NOT NULL AUTO_INCREMENT,
---- title no null
title VARCHAR(30) NOT NULL,
---- salary no null  --DECIMAL to hold role salary
salary DECIMAL(10,2) NOT NULL,
---- department_id INT
department_id INT,
---- PRIMARY KEY(id)
PRIMARY KEY (id),
---- FOREIGN KEY (department_id) REFERENCES departments(id)
FOREIGN KEY (department_id) REFERENCES departments(id)
);


-- employees --
CREATE TABLE employees (
---- id INT no null AUTO_INCREMENT
id INT NOT NULL AUTO_INCREMENT,
---- first_name VARCHAR(30) no null
first_name VARCHAR(30) NOT NULL,
---- last_name VARCHAR(30) no null 
last_name VARCHAR(30) NOT NULL,
---- role_id INT no null
role_id INT NOT NULL,
---- manager_id INT can be null   --- link name of manager
manager_id INT,
---- PRIMARY KEY(id)
PRIMARY KEY (id),
---- FOREIGN KEY (role_id) REFERENCES departments(id)
FOREIGN KEY (role_id) REFERENCES roles(id),
FOREIGN KEY (manager_id) REFERENCES employees(id)
);
