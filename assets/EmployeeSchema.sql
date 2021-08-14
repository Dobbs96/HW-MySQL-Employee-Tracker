DROP DATABASE IF EXISTS Emplouyee_DB;

CREATE DATABASE Emplouyee_DB;

USE Emplouyee_DB;

-- Data Tables --

-- departments --
---- id INT AUTO_INCREMENT
---- name VARCHAR(30) no null
---- PRIMARY KEY(id)

-- roles --
---- id INT no null AUTO_INCREMENT
---- title no null
---- salary no null  --DECIMAL to hold role salary
---- department_id INT
---- PRIMARY KEY(id)
---- FOREIGN KEY (department_id) REFERENCES department(id)

-- employees --
---- id INT no null AUTO_INCREMENT
---- first_name VARCHAR(30) no null
---- last_name VARCHAR(30) no null  --DECIMAL to hold role salary
---- role_id INT no null
---- manager_id INT can be null   --- link name of manager
---- PRIMARY KEY(id)
---- FOREIGN KEY (role_id) REFERENCES department(id)